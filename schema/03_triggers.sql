CREATE FUNCTION public.update_last_viewed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE public."UserProfiles" 
    SET last_viewed = CURRENT_TIMESTAMP 
    WHERE user_id = NEW.user_id;
    RETURN NEW;
END;
$$;

ALTER TABLE public."UserProfiles" ADD COLUMN IF NOT EXISTS last_viewed timestamp;

CREATE TRIGGER trigger_update_last_viewed
    AFTER INSERT ON public."Viewings"
    FOR EACH ROW
    EXECUTE FUNCTION public.update_last_viewed();
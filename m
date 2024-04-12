Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540814D2B1
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712944751; cv=none; b=c5vdbOYOihZ05bEroNtAu3DvorrHd854Sh7F9TZ1fAhD90RxI6Ly7yydewQIsv0cQBn2ws7AgETxYILyiTEnTbjJI3YJjzkQVIQ3+MrPL5AQQlWNDlmR0IAgOxGAiafnw8cMtRQQFq6vrsnfvRWlvIDb6nsSEzuX5b7Pgu6FJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712944751; c=relaxed/simple;
	bh=xW9Pannq9Ylm/ehaUAnV09AHmSwQXxi12MZV+pE8Smw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCY4CR7sksdHC5bsms9Kf3N1sJPNHbEKzfPL5evBr4MYxRLfLL3gqpw6/GKhIJHpfP4qGlLccZr64gUikNb56sW9Cr+L2ITJVajgmU6rntVou9rzSVno7b7VEQ2ul/uJ0f0+Ai15D/eArl9yozxqWiJqtbvpQJTj7GvvPKe/F1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAmy2/Fh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAmy2/Fh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e2232e30f4so10866225ad.2
        for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712944749; x=1713549549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwtixN/lO2iBv+anS3Drzlg4Mbq3JF5eL0nymgRd5Qc=;
        b=gAmy2/FhR6fWmHJ+5HYQqY40eN9Bmsayji7DnxNG9xUeO/GDaDzg4Obv5xLAKsTul2
         H8BwTkyBPcjXzdl7sVo85G57ZDF8UkBVKGfdTLgI+itdwibDu1ptdCPsJa5UpthdaEnv
         w8C2iPFW0+cFHpTuQjH9KKeqM4TXLvqB2rLpZwDf7yo9msOGjSQSq01BoLPIfAljM5NW
         uDVw0LfIzZxwTVxmpGj6bqKK3bFVCETdQ2rqvLIrcRbi9PqScWLlf27TtNixRMH3nbSu
         9AcNuZ52avWOfKFlbIbrob35CvR9oT4cgKCvrw0K18XWA2fhn0XYn0H7UmTo2kJxrJnl
         U68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712944749; x=1713549549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwtixN/lO2iBv+anS3Drzlg4Mbq3JF5eL0nymgRd5Qc=;
        b=hwaUwTh7lEoTESISoVRdQjlWLVSbMoGsRhtVp24uU0O2tPXx4G5cZ6seBWPH+F6OzN
         IQh7tTU4ngqyladIdLjbmMC3bLhMb45qWabA/GT8JVduD2FIGHizLGYza/B2Jrm4RJLH
         1CcGWMTnLNtwGPpJg6T+Qb71TIOP/Hqd1dKDJqNyGD0+tB2nqprGR0ajC9Us5dh7J8Sm
         vB7OezoiqlPMzijCVU7pqs7SGPCB6mvKp/fvYq4c377lSioLofMOmvPo8+5/U6QJh5/p
         cU2kTbVBF6DBWk6tKod0Tz6YE9Cp2B6e+7YELUQP8exSsghiTiOOeNyPoUHmVwfYhXyG
         FppQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN57p3dqmnv5FGQF8YNTd9HJ+Emq1lY3MxZNoYGxIYD6SFmkZOzYAzyhwJXXS67kXghalNv8tJIvNUPpI1FvpU3ItzMGDsUL9U
X-Gm-Message-State: AOJu0Yz5f4KHVwYrKTl1j6oaztKycj5AAAPvyWdAaEXvoHfwBBpyIuXK
	LNvDPcxdFTUCcV2L9Ou4HCRkF1a8FFZM/B9Hr+aW4AAh5/PB7Awh
X-Google-Smtp-Source: AGHT+IF9m8VYtSEPQPguK6wUbN5cQCjmnQWPkTPp3hExAb5QN79ynN2Hsf6aHQoYDXqTWIsKnV486g==
X-Received: by 2002:a17:902:ce0e:b0:1e0:115c:e03c with SMTP id k14-20020a170902ce0e00b001e0115ce03cmr3677174plg.53.1712944749482;
        Fri, 12 Apr 2024 10:59:09 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:a5f4])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001def175bbbfsm3276304plk.251.2024.04.12.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:59:08 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 12 Apr 2024 07:59:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
	jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
	pctammela@mojatatu.com, yukuai3@huawei.com, qde@naccy.de,
	zhaotianrui@loongson.cn, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	cgroups@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 2/6] blk-throttle: delay initialization until
 configuration
Message-ID: <Zhl2a2m3L3QEELtj@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-3-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406080059.2248314-3-yukuai1@huaweicloud.com>

Hello,

On Sat, Apr 06, 2024 at 04:00:55PM +0800, Yu Kuai wrote:
> @@ -1480,6 +1547,9 @@ void blk_throtl_cancel_bios(struct gendisk *disk)
>  	struct cgroup_subsys_state *pos_css;
>  	struct blkcg_gq *blkg;
>  
> +	if (!q->td)
> +		return;

So, this naked test is safe because the interface functions are shut down by
the time this function is called.

>  static inline bool blk_should_throtl(struct bio *bio)
>  {
> -	struct throtl_grp *tg = blkg_to_tg(bio->bi_blkg);
> +	struct throtl_grp *tg;
>  	int rw = bio_data_dir(bio);
>  
> +	if (!bio->bi_bdev->bd_queue->td)
> +		return false;

and this one because ->td is set while the queue is frozen and this path
shouldn't be running while it gets set, right?

Can you please add comments explaining why those are safe? Otherwise, the
patch looks generally sane to me on the first glance. Can you please also
add how you tested the change?

Thanks.

-- 
tejun

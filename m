Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FDEA4
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713316928; cv=none; b=V6VZB3pQv4evCLQheKjKGs+BMM3kVQMiICG09j5ddG8h8G1kdSuyXYqLMalZtK31TErk3UgNaNbAAVF9AddJXIPK1aEDrX717pxX1GeThOWLX5mAveYDZONheK0QfmuGPnYjN0sdzIkkGLlQwJ7cnlyJVGbHCR0DZKZlYyQki5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713316928; c=relaxed/simple;
	bh=DUYFWX4LWKaLj5DBHUFDv8Fo12atozH9lyEhZH1CAuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmbPKVjxUT9JMipy9dUHKLycQ5TJ0bAMGnuhg+J9g0Klqryp8af+u3DloQ9KAJv5HhTkUXSJWpjotnBTUj+0t9T4UcPe0TmIAipyncZQncgsHF0ajv5KeU6PMZ622mjia8yCGsFp4RXef+tiG3LEOmLaZlRiNIMBdNTJVMIyeHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5FlbbC6; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5FlbbC6"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6eb8ea5ac95so991151a34.2
        for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 18:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713316926; x=1713921726; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnX24HJPnbW9GAV5sbrmRceYLlMBy8M9WyMVqDoxp/w=;
        b=C5FlbbC65JVyDjxEVPxlD6aN/QdQXpTfgphy19+haIW449Vh5QOAcdUApndzAbw3Yz
         kPhw9w+kfqLNNknQkaD5BdS6aCt1JgH9Zqp1a20WEmd4KmGVEZthW06M6TrR9N7uk4Gs
         rGRzhkq9daAEeipjcShipwd+vAnbc4DDxvqEEB0uUG6PKrdWe/K3p1JTsZhFmN+9nOMX
         uyxTly2rVbaueHzPBJ62bd3AXGaFl4c8ZbCJv+1pVRK/MoODBSbNRovzZETpU+pbUrN3
         fZTC8Ecko+N7wW399Z1eoxBVPqjw680fbIgNvOCtUzvDxKdbey7Xw0gEPTJ70egIMdha
         4xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713316926; x=1713921726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnX24HJPnbW9GAV5sbrmRceYLlMBy8M9WyMVqDoxp/w=;
        b=N3C5X5PxcVbpJDbHt+Q3cmBJYczD4EYfWMmnu+2z02bZ+9Vom9l5GQNs5ekNf0k2RU
         m2HhkHFda9zuW73eocRgiHXSFIlnxbrF6w0/X9WMfBQ1JFTQalTu5/XkDWr7SZw/4AG1
         nicaJwsV0fdz7Jrvp4wbRt1CAFCjadvil0XdLow98BcdXUHeeDO3cU3HuSi/S8dJBt83
         DDC+DnVcKI78l1FwRBpu6tLHQat8pyIieA3Y2TGymcGDzWGHZKbteDx25ciPJiD8Q14t
         FU+FgHyQSbZilVxZcsthUdqHW5pIVCR1xUJcIBk3IsUvtaSpDCu8T22ttPlc7LFfN3Bq
         LVgg==
X-Forwarded-Encrypted: i=1; AJvYcCWjRqtBJDiT0rqITiZOsqK+5/0ln5ElX6DozPHQC9aaLwwsXq7SB3iojN1GOrW2J1Kv3e0M9WFwS84RMwCubxe6wu970xkZ61d+
X-Gm-Message-State: AOJu0YwNYKpvxxwIJPVzbgHT3xyajWRMc3CwOPCbiJhVsnnwkncHOGby
	RcuuOen3jfDqpL2r34BeWYQ4cBVjHAEEP3uyueeZBal9FVR6ScWK
X-Google-Smtp-Source: AGHT+IFQN2WvDvVvDfE7SiVQ/ZNnoEulyk0oTfQIzF72qCPjRTZocptPi/+XMX8fSvsGmb3tvGg4Ow==
X-Received: by 2002:a05:6871:5224:b0:221:a881:df51 with SMTP id ht36-20020a056871522400b00221a881df51mr16998129oac.44.1713316926264;
        Tue, 16 Apr 2024 18:22:06 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:6f51])
        by smtp.gmail.com with ESMTPSA id x17-20020a056a00271100b006ed3509ecd0sm9665987pfv.56.2024.04.16.18.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 18:22:05 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Apr 2024 15:22:04 -1000
From: Tejun Heo <tj@kernel.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
	jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
	pctammela@mojatatu.com, qde@naccy.de, zhaotianrui@loongson.cn,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, cgroups@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH RFC v2 5/6] blk-throttle: support to destroy throtl_data
 when blk-throttle is disabled
Message-ID: <Zh8kPGAu2TG4Su2M@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-6-yukuai1@huaweicloud.com>
 <Zhl37slglnnTSMO7@slm.duckdns.org>
 <1bb85208-1224-77dc-f0b2-7b7a228ef70b@huaweicloud.com>
 <Zh6wx4mXZy_EOViH@slm.duckdns.org>
 <19086c09-3060-a4ce-4ac6-811a29653979@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19086c09-3060-a4ce-4ac6-811a29653979@huaweicloud.com>

Hello,

On Wed, Apr 17, 2024 at 09:13:34AM +0800, Yu Kuai wrote:
> > Probably a better interface is for unloading to force blk-throtl to be
> > deactivated rather than asking the user to nuke all configs.
> 
> I was thinking that rmmod in this case should return busy, for example,
> if bfq is currently used for some disk, rmmod bfq will return busy.
> 
> Is there any example that unloading will deactivate resources that users
> are still using?

Hmm... yeah, I'm not sure. Pinning the module while in use is definitely
more conventional, so let's stick with that. It's usually achieved by
inc'ing the module's ref on each usage, so here, the module refs would be
counting the number of active rules, I guess.

I'm not sure about modularization tho mostly because we've historically had
a lot of lifetime issues around block and blkcg data structures and the
supposed gain here is rather minimal. We only have a handful of these
policies and they aren't that big.

If hot path overhead when not being used is concern, lazy init solves most
of it, no?

Thanks.

-- 
tejun

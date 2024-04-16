Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C5131BC0
	for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713287647; cv=none; b=h32Tc1mqBS9lpgq5zyeN47GlJZHEDPRu6R7FzIKClritpp4puQHnIC/CPRf2XGB6xkTHoEapCuIDWeaJBcw5b8ovr4WpMK3WcmWLhQj4kpdLEaVk2CXLj4sE8tykD2HTYYOeCRVEWegfvJhFUXgJyoxbq5Yk4ogRcbLR1ATWdfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713287647; c=relaxed/simple;
	bh=fH5JgqiKEnLVRAAgigZ9jYzXKDlwWN3mE1ZQUxFztW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHIxecXIaTKeMEyl7teW4TBhgV98B7glYTN2k0e7cMDyf7gAVjt0jltX48h2eHUhEdteWdgRQHOt5RgyTWh2FIXIxJJBzv+mW+KHrpwMDRVR5pKSeSSttD2/lbaOzSnoJWxZW0XhOkWD0nS1sgJO6yWJsFhijB2ZBjzPr1nqccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ1hJEd9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ1hJEd9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so37654785ad.1
        for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 10:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713287645; x=1713892445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLo/QSMSRznZe22AzI5HBGVWsg1YKDnNUJT4cR5k6e8=;
        b=MQ1hJEd9wJTs5224UGeoXTD14+sKm4cSinFqeFb0RqM6bh/Kel0KALSPLpUJH5ismX
         ZhVPECrFHqmHGFF5usp4N8BdJNe+bMstD+Mu4cJJaVyZGl8JjNRxiA8mZWLTalpkNfA1
         xqHjNqx5AO2FveBf5c/7WTYs6yQmpIQ8OlN6WvVs/l5cv6y2QrOEIB2py/MKzUuVtdaT
         oJ/vq3n5QvNfMsRMk5F6XJU/SRbpSHcUyp1VEkT94i/d5+LW94WalTDV1SwJXhz1DESU
         RERq9PmtDCrKOX03VR1HCDaYN0whTZHi0MC0qx5FKlZSyr/qQdQ/WIYXkpPuj5w7RV2Z
         yBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713287645; x=1713892445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLo/QSMSRznZe22AzI5HBGVWsg1YKDnNUJT4cR5k6e8=;
        b=ET/8jP0UEQwM5gTarivmVMi49SMrHVECuF+s0o/DxaOwKsJnZGY5LIXTIahHrMULTP
         6CdcxWa3Elz2n33yL+GQVOak/khG4OGB3nU4x55TRWeeLNHqaAaybQz8P2B2c5D8IMiX
         9oOphyNjTWVaGHujpCSeMkJhbIRTY+ANUNlOIWow3NxyOZhQPHGnSQvXf+FBaMU1ckeB
         SvLSoFo7yAOWnGK870ZxdUKw76dLBaJkXTGwvP3lxYis7W8pQmlcYjZm9Y5m9eiWwKk1
         4v6eO3ACtg5M16MKyV6k1NOB7Ztq8EPzTbNz12pz+sOEuOiNoSMjLljM+tSDw+g6pvyc
         mPtA==
X-Forwarded-Encrypted: i=1; AJvYcCWYWmwak3eMGI76KdTcDAa7gEJf6zKNmfktseCrloDe67TVnBkmrm6k6iOxJ06k0JwzWq1cfn6MQrIopgMpyur1sBdGZlK2umdT
X-Gm-Message-State: AOJu0YxYeEL7rHreJR6akoeZeSopkKRipBuU86qpB6vN+M1SQfE1XU78
	52Ei8cUxvIwm/eJLod/E3wTefMEESFRrAIHl2/3EGBSRPULQm6bU
X-Google-Smtp-Source: AGHT+IHo4pXLUdEf2ip3j2j6IlKDCSAPcl7YtF3XJ7lOsnTGoOiM3XKIkV6mMGbV/aUNYtmpXr+R0A==
X-Received: by 2002:a17:903:1105:b0:1e7:8d21:7fd7 with SMTP id n5-20020a170903110500b001e78d217fd7mr6134876plh.28.1713287645387;
        Tue, 16 Apr 2024 10:14:05 -0700 (PDT)
Received: from localhost (dhcp-141-239-158-86.hawaiiantel.net. [141.239.158.86])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001e511acfd0esm9997466plg.140.2024.04.16.10.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 10:14:05 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Apr 2024 07:14:03 -1000
From: Tejun Heo <tj@kernel.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
	jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
	pctammela@mojatatu.com, qde@naccy.de, zhaotianrui@loongson.cn,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, cgroups@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH RFC v2 6/6] blk-throtl: switch to use rq_qos
Message-ID: <Zh6x21Y2T1NsaSak@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-7-yukuai1@huaweicloud.com>
 <Zhl5ONFlPg4vqjGj@slm.duckdns.org>
 <b522c2b7-efae-a7ca-ee6c-197a4b9b54ff@huaweicloud.com>
 <ed253aa4-517c-0f56-5550-96b23093528b@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed253aa4-517c-0f56-5550-96b23093528b@huaweicloud.com>

Hello,

On Tue, Apr 16, 2024 at 10:17:29PM +0800, Yu Kuai wrote:
> > > This is a half-way conversion, right? You're adding a dedicated hook to
> > > rq_qos and none of the other hooks can be used by blk-throtl. Even
> > > the name,
> 
> Actually, rq_qos_exit() is used as well for destroy blk-throtl.

I see.

> > > rq_qos_throttle_bio(), becomes a misnomer. I'm not really sure this makes
> > > things better or worse. It makes certain things a bit cleaner but other
> > > things nastier. I don't know.
> > 
> > Yes, the final goal is making all blk-cgroup policies modular, and this
> > patch use rq-qos to prevent exposing blk-throtle to block layer, like
> > other policies.
> 
> After thinking this a bit more, I still think probably rq_qos is a
> better choice, and there is something that I want to discuss.
> 
> There are two different direction, first is swith blk-throttle to
> rq_qos_throttle() as well, which is called for each rq:
> 
> 1) For, rq-based device, why blk-throtl must throttle before
> rq_qos_throttle()? And blk-throtl have to handle the bio split case
> seperately. And it looks like blk-throttle can switch to use
> rq_qos_throttle() with the benefit that io split does't need
> special handling.
> 
> 2) blk-throtl treats split IO as additional iops, while it ignores
> merge IO, this looks wrong to me. If multiple bio merged into one
> request, iostat will see just one IO. And after switching to rq_qos,
> bio merge case can be handled easily as well.

If we could properly convert blk-throtl to rq-qos, that'd be great. The only
problem is that there probably are users who are using blk-throtl with
bio-based drivers because blk-throtl has supported that for a very long
time, so we're in a bit of bind for blk-throtl.

> Another is still add a rq_qos_throttle_bio(perhaps another name?), and
> meanwhile iocost can benefit from this new helper as well. Because
> iocost really is based on bio, currently it must handle the io merge
> case by debt.

I really don't think adding a different operation mode to rq-qos or iocost
is a good idea. I'd much rather keep blk-throtl where it is and come up with
a better replacement (e.g. iocost based .max throttling) in the future.

Thanks.

-- 
tejun

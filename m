Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFA16FB2
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 02:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713405918; cv=none; b=p48KRNErgrutfq2JbpUgYC82AjCEHBDH/8uB6iMSeDZi0JQm8qluBfZRPlYcJE71zvPzN+l7BzDWaOoSnY6e3+oXPmCPlSGWWo7ablsyimNYHaO6OMHnuWK0HcxLio/82aAKBc6DKKohZIJvZNHnLKDnkqvsyHCVg2LpQnSRaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713405918; c=relaxed/simple;
	bh=73LVQrfjmvrDVO+kAsF3UE4WMxKTnsJSv1IvmJzeqnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/20haU11nwrJ4rUzpsk8F0oLWkbVLvVTaohdIHVjp3tbMLbFXIL195KJ6kJyFrDN3gZFrgoc4roVTbCOD21NpFR1P7/TEhWsOAVJZPiOuAUBXSSJR82UidZpWnYsFEyTMtZLB3zwhp9ZvhZwGacttKV9cXyJEeEplJmMaKrGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqmC3WCl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqmC3WCl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so265379b3a.1
        for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 19:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713405916; x=1714010716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dav8LT6ZkkrV7Xf+PoaKXV2rDAf6ehRkqp4ZSiFp8Pw=;
        b=iqmC3WCltWrq/cPBMr/yw0y1/3LTRGgs4kXWVvZ8+SlxpyCNjmDhYZ3g6F9yYSPcbF
         wyY6KQhiJprBCvcEOJX0J3RjDvwR2oKm0URz97ic/cgrPrDSa1WwxGdzIfgtKqhmkDHV
         aWLG1EGI0iAHSzQDBYoibEIszbhpUyeXtW9fDmmLapduc8R3RAs4TeEYN2XpcHUzWCUK
         bzLjKjJcd45VVrelt1gJNNZSN09DhJfmFJiimZAlzc/HcjcMjdh7vdL3nJZZG5S2+XP3
         7RDJPQfn6m9cZlZYpj1O7lnOsmI0n/hW8+fpYxXd40xot43CLOz3NTUNQmAr1Xcy8pTq
         id9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713405916; x=1714010716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dav8LT6ZkkrV7Xf+PoaKXV2rDAf6ehRkqp4ZSiFp8Pw=;
        b=rgSVk0hDpUoZUmTrKYb73dwcxmGpO5vBDVlvQkJTBRbweE/QE+sEPpf3HRc64CyMQh
         IJuu2I0iGP++3bkMT0Ruwr4KZss91ousIT8oikQFdCJ5LfEw4L7K/RlQTn1ePPTJ1fTw
         NzFuW1zo/vab32Qy0v8J6Q/sGXbAoHhUshQM7wvPD5xAd/L0G/kJo2EU56z/ogR+ufs+
         4iy1cdKON6iIsHFX8Z1qVVFl3S0vwfbswhAuf5tEyTIoQkfzRtB7cdcqmZuS9Dmiw3Ye
         1Yzs/HQSdV8yze4zUEb2aKyyQWPyIJdcl/cgDbvg54B2Yct8jBxjP0rAG6GWfkR9pShW
         oxUA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Fn4174qxE8+Ui/BzzZPHNWKYP68nY53yQS61Rr2ZmfNgS/eH54PWJNELbBfmSS3FDxNGGDXMMOVen61QT3gKAwbcUOepgpha
X-Gm-Message-State: AOJu0Yx+CvBUjT5Z3mIttL6aSyXm+ZKWm28prIQXmJVOnc1UY7qF/WDp
	4R8jadhprc8xnn+17e2lvTJEJnc9XJDqSje4hiXVdXbvc9ItBxlf
X-Google-Smtp-Source: AGHT+IG5SxIK07Q/miAgOz8egYZfpCoEBFkaUYGR29gIiRkZu7799/SYMMBv2tExbxkUjc8I2ntfzA==
X-Received: by 2002:a05:6a00:2789:b0:6ed:4b2d:a764 with SMTP id bd9-20020a056a00278900b006ed4b2da764mr1361359pfb.11.1713405916495;
        Wed, 17 Apr 2024 19:05:16 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:6f51])
        by smtp.gmail.com with ESMTPSA id k26-20020aa7821a000000b006ed8379fe7csm350584pfi.75.2024.04.17.19.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 19:05:16 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 17 Apr 2024 16:05:14 -1000
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
Message-ID: <ZiB_2ryBOxq2_IyG@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-6-yukuai1@huaweicloud.com>
 <Zhl37slglnnTSMO7@slm.duckdns.org>
 <1bb85208-1224-77dc-f0b2-7b7a228ef70b@huaweicloud.com>
 <Zh6wx4mXZy_EOViH@slm.duckdns.org>
 <19086c09-3060-a4ce-4ac6-811a29653979@huaweicloud.com>
 <Zh8kPGAu2TG4Su2M@slm.duckdns.org>
 <1ed63126-d2e6-f0b6-42ef-127ecb464955@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed63126-d2e6-f0b6-42ef-127ecb464955@huaweicloud.com>

Hello,

On Wed, Apr 17, 2024 at 09:39:43AM +0800, Yu Kuai wrote:
...
> I guess I'll do lazy init first, and then modularization for rq_qos,
> and leave blk-throtl there for now. Perhaps add a new throtl model in
> iocost can replace blk-throtl in the future.

That sounds like a plan.

> BTW, currently during test of iocost, I found that iocost can already
> achieve that, for example, by following configure:
> 
> echo "$dev enable=1 min=100 max=100" > qos
> echo "$dev wbps=4096 wseqiops=1 wrandiops=1" > model
> 
> In the test, I found that wbps and iops is actually limited to the
> set value.

Yeah, it shouldn't be too difficult to add .max support to iocost so that
you can say something like "this cgroup subtree can't use more than 60% of
available capacity". That'd be really cool to have.

Thanks.

-- 
tejun

Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0582485
	for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713287372; cv=none; b=prDkzsoOdYhGS1bsKQeSuV0vLMJXjpqyIelIe2U5qY/rV2rhkOjyglPV/RUIWNTLNuWyL778IWvdHMJY/HE+D33BG/cnFEFAEwKgcuWOURt088PXxHnZwbzV70wIWpFOAIR5cA1bZP8SFQoR1+nBBmPVPQciDPy9/ZXcz8dOw3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713287372; c=relaxed/simple;
	bh=DUpZQcj0Q4Y4tjm4OpJ+gbfAVkEDRRSpm1tH1KPWzqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBugm20tQh72xrw1SwUkiR77U55WVTtRAjkAhhCToHHDFZCp22+I9TGeTSKQNpQZwp1LE7K+NC1xeHF5Tmn4TqWkkeq3FQt1cTsLBoc9hnb4wpuQW/1DdERlP+4Xut/aHwgHJyKZ+Q/JcCYdD/b1p0VjfKCfpDwZLbXUJBZ77PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtAYx3Ik; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtAYx3Ik"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a53a4a283eso3923940a91.0
        for <loongarch@lists.linux.dev>; Tue, 16 Apr 2024 10:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713287370; x=1713892170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHUy3BTU7vf8OKYXFB2qGMv/9WxQZ2YHgvNS8n+tlds=;
        b=OtAYx3IkHQgjXJ7yUAD81PM4fVPaeVFP/HSUbvhiqG1hySoGWDnfop+dVKJ9Y+bxR+
         t4lFzVZ3LbagSx5hICH82Kl70LQCDrJ1kOAD67ibKCkW0YCj+ilXztSrxTndsEG+w0mw
         bRHs2mVVdek9v0k7wlJta0I/KbLUAF1auCg3LzcZSH1tDdn66DoeJmayt4Fh0CIXnKFq
         jGu5tuFDHCJQkpusfQVXJcjl+hzjA39GWMVXyW47CErlgzdbrVwNuFS/20EXVU7EeKqO
         YKI++Y3Zuy4v/9UQN3QaPoT9scfFNeZtHbX7jYBiZhRgAG5qDZT9UMIKSnTogpbwOh/D
         gYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713287370; x=1713892170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHUy3BTU7vf8OKYXFB2qGMv/9WxQZ2YHgvNS8n+tlds=;
        b=EHPRE39Sgd+OdxorZsaSEyMiXiIiHC1EzVzkVNKCm4fRwBTVFGKFlvenWit5PaO0fA
         sDVTV6tidaJUYNjeaasylgvVu4tYUZmfHpGxc1C3cmheFuWSGqyEN45JxB3tC1K4myUO
         3tWRlcSOvbkcrfD8IHcqB4YZMJyR16kfqvQSF/HxWTXFE/WU/GSUvYm9BQj9wlwSB9Nx
         iaqTKJgxM8nrX8YuZDUw9U6pZC1dAQFM34fZt/O8oNfVuD/QsE0aoyaH40VrrPFVLwTS
         7hyvSC0XQ02fIpCh2Cvyzf3ymbVFNdy9xokjIv12KVEx/2jYxmnYG0nAaG4GEj7qh6HZ
         Sneg==
X-Forwarded-Encrypted: i=1; AJvYcCWXW45Rh9vW/a3AJwjznTgrw01dHzY4AmWI0krShiRGtSIb8puLQH0atG3/FZZN2Si//A1oKBhMpzF8gCoAojYgtPuO9SJiGYKt
X-Gm-Message-State: AOJu0Yzlgpmtm/kRczG273Kkxps7REDaXt6uR0/9UCYWETeLEXhA/eZm
	ALwdCr9EfnZ5qyGVFKXDC4vDqmQMaPZoPqtI7egaelketg2a5JwB
X-Google-Smtp-Source: AGHT+IG+CRkxLfB6g57yny9+gaNCdFI1vNgBjGCWNjHyv+ieg7Qj/HQyNA7wS2R2epCfbsKCveDSLw==
X-Received: by 2002:a17:90b:4d89:b0:2a2:bd4b:764f with SMTP id oj9-20020a17090b4d8900b002a2bd4b764fmr12490553pjb.3.1713287369756;
        Tue, 16 Apr 2024 10:09:29 -0700 (PDT)
Received: from localhost (dhcp-141-239-158-86.hawaiiantel.net. [141.239.158.86])
        by smtp.gmail.com with ESMTPSA id s6-20020a17090a2f0600b00299101c1341sm10182573pjd.18.2024.04.16.10.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 10:09:29 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Apr 2024 07:09:27 -1000
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
Message-ID: <Zh6wx4mXZy_EOViH@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-6-yukuai1@huaweicloud.com>
 <Zhl37slglnnTSMO7@slm.duckdns.org>
 <1bb85208-1224-77dc-f0b2-7b7a228ef70b@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bb85208-1224-77dc-f0b2-7b7a228ef70b@huaweicloud.com>

Hello,

On Sat, Apr 13, 2024 at 10:06:00AM +0800, Yu Kuai wrote:
> I think that we need find an appropriate time to unload blk-throttle
> other than deleting the gendisk. I also think of adding a new user input
> like "8:0 free" to do this. These are the solutions that I can think of
> for now.

Probably a better interface is for unloading to force blk-throtl to be
deactivated rather than asking the user to nuke all configs.

Thanks.

-- 
tejun

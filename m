Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE613A88A
	for <loongarch@lists.linux.dev>; Wed, 26 Jun 2024 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376487; cv=none; b=Ku2OQMqDS9DK9Ia8uP9XGvjbOvWn3krJIqdMCekJJfk2CgHatSpQxlDcykniMGP/kyeEIb4KuNncq5lyUkyUBasPazGJKxY0wSqUw3FzHg0kUKLaLBoeYeZ4Orvh4St6iKKDCBr+Km4nB7sVbNV3VR9wfge7KLO1CqrTe3J/dKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376487; c=relaxed/simple;
	bh=M6WBnQVFtvyi2wfyjqjz4MRvXlMKTTXIHg+isqJ9GL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiBJjjshWOdGxtBu5t5CNHX3XsOi9gZyDpOTPQL6Sy7oslGDRAJZqhJ0pQdfd+mqxnncN+OvKbVfAeGmC4rpKtoTUcoG4gsP7Sg33xdbkHKh3bUpHIIcE8F0rlf6kobNnFQNK4dl48YoBzUsXW7kHSLURg+3nmp2in9SmEzWLhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PjgmO/L3; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjgmO/L3"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d562882f4cso57945b6e.3
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 21:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719376484; x=1719981284; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VG4jlRyCD+JGeMHjtnplqjiPI6rXDpxs/+8GzPHHLGY=;
        b=PjgmO/L3Fpb3ZKA1ZeooRWAZUhAQjayoH/lN0lvIOXpB6guIIllnfNs5p+g4g/Kyur
         BF7fuPr2avS8TU9kNE1wCn44JcoCpXXT0uycumvY1ryfRJy7pTdlDaGcDvg+n0w1itbG
         7P+wNMpWATUfLLYgxIpfyfQ+OwNVuv4IHtuvhJOS/W06gCgDrovKCPHazISOKaW6qam3
         sExULxT91dVg9kVSHOwFt/TQUjGDKngIS+kCVm6eL6GMUw7DTIyyg2BItCM2tXvDDh01
         q54PFJUm6tFSP5cAM1Yae2O0lxnGfi8EnGgClj0Wyb+q4F2rPQBRauD51v7NGPNMLlUF
         01vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719376484; x=1719981284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VG4jlRyCD+JGeMHjtnplqjiPI6rXDpxs/+8GzPHHLGY=;
        b=EieHkSTXiNXSqMweCZ0Y+jk8K1j1hGSiNF6muCmo6ECMWmSX3KJejQkIReYyF9p+ii
         NzzwuYHuCejikc4ysOTQpbzCHC/3VbxalQgaSL2g1oaZsfryFe+V3/Wi8RgBgPnnXdOB
         23ZAdgRtZo96QfWVUH8dqcwX/PfVW3Y9odjrhAFlUlPn90XSZdcEvf0Dc1DBTY2DNl66
         kFvLzBqJIyEoSSpTebSqDzxshT7jy4HFG4bbwS2Wa2+SSxHLzf8AwI/4K21QU3//4hAI
         i1d6oabB7K7njK7l2bzUYlVwQ1osKLpPS2x0UKOGrLV0S0gA0q2wB13s9skYQT5RMWb6
         B7GA==
X-Forwarded-Encrypted: i=1; AJvYcCW9fK6TTrb/NmA8rJ9Ms3JF0MX3bGrDgNgzlc37mNwSfrzb71mR3vx6JXGz2DE11C9TTMsobcJCpT0zow24jCrESrorYEVqPyr1
X-Gm-Message-State: AOJu0YzZ33YbNijZGesuFHmx8qhhk3KR5hPr6AE6GlMlh2HLNIvGm6A3
	WdGK12nUBfq1xyxnn4YQOz0nddb0Sv+zT3CY1p+gY7e7OrtfG+OcFnVdbxV8cWY=
X-Google-Smtp-Source: AGHT+IF3TEvGQGK56opiow5WQuF34xaU6ta0N1F6/fCI9qz1DpGK6+xYltdN/QIwdgVNxBwrPte07w==
X-Received: by 2002:a05:6808:d4b:b0:3d5:1a20:e8d9 with SMTP id 5614622812f47-3d5459654c0mr10675896b6e.24.1719376484472;
        Tue, 25 Jun 2024 21:34:44 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068af60b61sm4155236b3a.134.2024.06.25.21.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:34:43 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:04:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH 2/2] cpufreq: Add Loongson-3 CPUFreq driver support
Message-ID: <20240626043441.tsmvhzw4mmf6xjzj@vireshk-i7>
References: <20240612064205.2041548-1-chenhuacai@loongson.cn>
 <20240612064205.2041548-3-chenhuacai@loongson.cn>
 <20240625075645.m372bpbe7m2dozil@vireshk-i7>
 <CAAhV-H5wSzhD373L61Mxvu-7ZUSGh9LmC4yBoaHm_5rAxsu-5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5wSzhD373L61Mxvu-7ZUSGh9LmC4yBoaHm_5rAxsu-5w@mail.gmail.com>

On 26-06-24, 11:51, Huacai Chen wrote:
> On Tue, Jun 25, 2024 at 3:56 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 12-06-24, 14:42, Huacai Chen wrote:
> > > +struct loongson3_freq_data {
> > > +     unsigned int cur_cpu_freq;
> >
> > You never use it. Remove it.
> Emm, it is used in loongson3_cpufreq_get().

Yeah, you are just filling it there and reading immediately after
that, which can be done directly too. But you don't use it anywhere
else.

> > > +static int loongson3_cpufreq_target(struct cpufreq_policy *policy, unsigned int index)
> > > +{
> > > +     unsigned int cpu = policy->cpu;
> > > +     unsigned int package = cpu_data[cpu].package;
> > > +
> > > +     if (!cpu_online(cpu))
> > > +             return -ENODEV;
> > > +
> > > +     /* setting the cpu frequency */
> > > +     mutex_lock(&cpufreq_mutex[package]);
> >
> > No locking required here. Core doesn't call them in parallel.

s/Core/CPUFreq core/

> I'm a bit confused, I think different cores may call .target() in
> parallel.

Not for same policy, but for different yes.

> Cores in the same package share the same
> LOONGARCH_IOCSR_SMCMBX register, so I think the lock is required.

If that is the access you are protecting, then you better move the
lock to do_service_request() instead, which gets called from other
places too.

What exactly is a package here though ? A group of CPUs doing DVFS
together ? Governed by the same policy structure ? In that case, you
don't need a lock as the cpufreq core guarantees to not call multiple
target_index() routines in parallel for the same policy.

> > > +     msg.id          = cpu;
> > > +     msg.cmd         = CMD_GET_FREQ_LEVEL_NUM;
> > > +     msg.extra       = 0;
> > > +     msg.complete    = 0;
> > > +     ret = do_service_request(&msg);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     max_level = msg.val;
> > > +
> >
> >
> > > +     msg.id          = cpu;
> > > +     msg.cmd         = CMD_GET_FREQ_BOOST_LEVEL;
> > > +     msg.extra       = 0;
> > > +     msg.complete    = 0;
> > > +     ret = do_service_request(&msg);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     boost_level = msg.val;
> >
> > This stuff is repeated a lot, maybe create a generic function for this
> > ?
> Do you means move the msg filling into do_service_request()?

Yeah, the filling of the msg structure, the call to
do_service_request() and returning msg.val.

> > > +static int __init cpufreq_init(void)
> > > +{
> > > +     int i, ret;
> > > +
> > > +     ret = platform_driver_register(&loongson3_platform_driver);
> > > +     if (ret)
> > > +             return ret;
> >
> > What is the use of this platform driver ? I thought the whole purpose
> > of the platform device/driver in your case was to probe this driver.
> > In that case cpufreq_init() should only be doing above and not the
> > below part. The rest should be handled in the probe() function of the
> > driver.
> This driver file is now a very basic version, in future it will be a
> little like intel_pstate that has more than one cpufreq_drivers
> (active/passive, hwp/nohwp, etc.), so it will register different
> cpufreq_drivers depends on the result of configure_cpufreq_info().

At this moment we can only review the current version on its merit.
For the current version, the way things are done is simply wrong. We
can review later once you have more things to add to this. So simplify
it to the best of our understanding for now and make as many changes
later as you need.

> > > +     ret = cpufreq_register_driver(&loongson3_cpufreq_driver);
> > > +     if (ret)
> > > +             goto err;
> > > +
> > > +     pr_info("cpufreq: Loongson-3 CPU frequency driver.\n");
> >
> > Make this pr_debug if you want.. There is not much use of this for the
> > user.
> Emm, I just want to see a line in dmesg.

Yeah, a debug message is what you need then. We don't want to print
too much unnecessarily on the console, unless there is an error.

-- 
viresh

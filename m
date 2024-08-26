Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4071917DF
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683205; cv=none; b=UH3/LLuPTfHhaE+wEtX/l8foPsO1xr/0c83JXauG9p688wZU8bwEAjr9RMHOLGscPSaDFkZYB1+KzOBRwm0FScKvwhtEGJz08JYnhusjeosjVNHHL25gw+m6iDplDkdL3LHHcMLOXWg/pvTkVnotxuYjpXVWHsYhft7XL4iDnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683205; c=relaxed/simple;
	bh=Ctct7FhOs5kvIU3l+geYiyju1k7Vdf2JX22/VaOv1s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STfMDMvZoHkEjv0UYg0IMDAHmckGZLRPbupY6xZjqJ8BKM+lipynkCZuacWdzhGiok2MXeihvw2UAHZBrzyfnf0/jfnQic1p9JUims9PZ6i0mbvzheWK0lSg1FgMSdBadGKSWNluLC0ovF39fM7TUMd5IXdJuGIJHHeGmEYcCCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjDarvbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjDarvbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C341C4FEF1
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683205;
	bh=Ctct7FhOs5kvIU3l+geYiyju1k7Vdf2JX22/VaOv1s0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OjDarvbMKWOHWj88SHWEhlkZAVkZbN+d0vKLu5MuXZMyT14syIXxzSdQDaf/1skJk
	 s3+nMy/SY+iksKvb+Y1Qm+TIGCrctv8f7ha8EYHDxf9qOcvJScuHTat3bR8+N+yzsz
	 pAUJ3j/IKujvEHbadUxOqHFvJnP2vrTTFpBl/IWow6zqLysaeVdyao03Q5+8aCTFnB
	 FIPsoQGQDt2GwVkDumBx1sArF1blbWeaPz8p1ERPlc79OQiHcdoZScNvZrDDvTNePv
	 2Yp3E2rWm2/RVk38hr5rnrT8sRDe5Bqb729nrcaGy5eH52lKGWtrq67iFhxftEunu4
	 rivjwlkUoFMwg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53349ee42a9so5168458e87.3
        for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 07:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQkyzm8KLHD+aJYK9ilQRaPJIZbNxtSxfX6sCGwnhQlwlP5dccKfo9hfOyuMGrOjhxFLngIQv9SWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnK6zIWeGR35DNAsbmv0IJCD0KFgzuPBS8dDs+y9mB2YaCvOTe
	T/VVJxTH2He903PFfA57nhmI7Z1vRhqmZ5Rgg8IyYXKdrNPt3OY4CdorIC8ItwPrZeBD7hKrvol
	PlacrYqapcFfqkMD5j/YAXv6jg9w=
X-Google-Smtp-Source: AGHT+IHkY48E2J1ziCxSk4TW9jvAO3h5i0fOHdu6Vfipe6wUWjDPVLV6c7P4ja0mzcQlVn8KnOjsmpNBxG4FBueFISs=
X-Received: by 2002:a05:6512:3ca4:b0:52e:767a:ada3 with SMTP id
 2adb3069b0e04-534387be485mr6059328e87.47.1724683202677; Mon, 26 Aug 2024
 07:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240705060650.243497-1-chenhuacai@loongson.cn>
 <20240705060650.243497-3-chenhuacai@loongson.cn> <4ad634a1b16285b4d83e7c320a5657b548fd6e22.camel@xry111.site>
In-Reply-To: <4ad634a1b16285b4d83e7c320a5657b548fd6e22.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 26 Aug 2024 22:39:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6W7PdxsnPzgd=C3=RVRr-4RefZXiXDNt4TJLsd7Ktf0Q@mail.gmail.com>
Message-ID: <CAAhV-H6W7PdxsnPzgd=C3=RVRr-4RefZXiXDNt4TJLsd7Ktf0Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] cpufreq: Add Loongson-3 CPUFreq driver support
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, loongarch@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

On Fri, Aug 23, 2024 at 2:34=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Fri, 2024-07-05 at 14:06 +0800, Huacai Chen wrote:
> > Some of LoongArch processors (Loongson-3 series) support DVFS, their
> > IOCSR.FEATURES has IOCSRF_FREQSCALE set. And they has a micro-core in
> > the package called SMC (System Management Controller), which can be
> > used to detect temperature, control fans, scale frequency and voltage,
> > etc.
> >
> > The Loongson-3 CPUFreq driver is very simple now, it communicate with
> > SMC, get DVFS info, set target frequency from CPUFreq core, and so on.
> >
> > There is a command list to interact with SMC, widely-used commands in
> > the CPUFreq driver include:
> >
> > CMD_GET_VERSION: Get SMC firmware version.
> >
> > CMD_GET_FEATURE: Get enabled SMC features.
> >
> > CMD_SET_FEATURE: Enable SMC features, such as basic DVFS, BOOST.
> >
> > CMD_GET_FREQ_LEVEL_NUM: Get the number of all frequency levels.
> >
> > CMD_GET_FREQ_BOOST_LEVEL: Get the first boost frequency level.
> >
> > CMD_GET_FREQ_LEVEL_INFO: Get the detail info of a frequency level.
> >
> > CMD_GET_FREQ_INFO: Get the current frequency.
> >
> > CMD_SET_FREQ_INFO: Set the target frequency.
> >
> > In future we will add automatic frequency scaling, which is similar to
> > Intel's HWP (HardWare P-State).
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn
>
> Hi Huacai,
>
> I got some error with the driver enabled:
>
> [    6.650403] BUG: using smp_processor_id() in preemptible [00000000] co=
de: (udev-worker)/208
> [    6.658719] caller is loongson3_cpufreq_probe+0x5c/0x250 [loongson3_cp=
ufreq]
>
> and the driver failed to probe.
>
> It seems the caller of smp_processor_id is actually do_service_request,
> which is inlined into loongson3_cpufreq_probe.
Emm, it seems we should use raw_smp_processor_id() instead of
smp_processor_id(), but I don't know why we haven't met this problem.


Huacai
>
> The .config file is attached.
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University

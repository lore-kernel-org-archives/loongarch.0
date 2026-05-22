Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C73019D9
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417640; cv=none; b=kSQTqPkjqfxkjmDD7iF4GSxW5+e4zedWudElwgCWAfuOSDeCD/PPrB4PHW+Sd//zOAhoyOOREr2Dxx99S+gyKuFwdNNbBojYeYuiNEHcJhi0dZZM4j4Q+iHTxCNoDk8s/VIbB5IPfBEqoGDIesX3vsvoae5Oup5q8SyZlb41v9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417640; c=relaxed/simple;
	bh=1MQQCTIMym7AentmuwIdZQz1dwprQy0M9FgU5eiOU8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6/6k4rPG4To/VkEAJQ6IiCzWs/CXvpatN8y8yMSqsFSi/ruTz0XWhzvFyMi3D9h4qM9t6Wu+c3nUJ1MJfmBtcoVQcOb82xDyY49UgIWx4xCyQRgot0pUFEtdJrLsU4LDYurmCxH+SbnKKpV6w+hUfzK++pTnuTYbBN3mYHIETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj5Zgztd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj5Zgztd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B121F00A3D
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 02:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779417639;
	bh=1MQQCTIMym7AentmuwIdZQz1dwprQy0M9FgU5eiOU8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bj5Zgztd3h6c6bkrytU0dnk2o8C5K8G762PUQ1joZDg6LiGlP4pGi4SZip2x/spMG
	 g9l2sIedjMZfpCbQwQCN0iFbQDQDj+T94zn0CHV6kkxJuXK0h/PXYJ78476UfOLCV0
	 AVo6ZeyAVkK2M1ZljDpEk54nOrjW0r8iqIJn/US06vhsdeiF19An5h+xvDYaHV14tp
	 EcqarOJGg//bQ02bGEbKcXMICVAkmm0BpBckik1A5JjK2VG35MJETLJp/6b3XvxCfs
	 lIQojMpggDjA4/Q1vjcXWmmPGr5c9vMd1+oVWKcDD4FcY4GWDijTIMnPLcRqFU7qof
	 LOP/PAdnmkTeQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdbac72ac1fso311832066b.3
        for <loongarch@lists.linux.dev>; Thu, 21 May 2026 19:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fu4g0j10m3itXKvfz/ZjMv+FfOGPB0aDV0BQgtJ0bXMoJIjGhKnFnDrU9E5ogF9VO2WjXl4cxBWM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9rXDMyumFQiFG6UwYl6PC+TPCTN/mPJXDm0p16pZqMZb3ZPcC
	HAccpN1xJ8Rwei5IkrpVRTjgKRh/mwudcnkDP9/I3AxL4Etg8pXfn+j2/9ARUI7cZOT7vJTTawc
	scGbmjHIBBlSTo0Lkc0NQrbS7DNS56vk=
X-Received: by 2002:a17:907:d113:b0:bd8:f771:ea9a with SMTP id
 a640c23a62f3a-bdd264c895dmr107613866b.41.1779417638433; Thu, 21 May 2026
 19:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512082029.2131-1-yangtiezhu@loongson.cn> <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
 <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
 <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn> <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
 <c4e4cd61-b909-dfb8-c265-437b86d6c2e7@loongson.cn>
In-Reply-To: <c4e4cd61-b909-dfb8-c265-437b86d6c2e7@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 22 May 2026 10:40:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4bLHQo7tkZt2j_=cai03wFKubV9Bg8LeCshz=ZQEmdag@mail.gmail.com>
X-Gm-Features: AVHnY4L151m6M0vI-s5nPt2l9GhL60MC5Q_yqLC9JlUSLla1VG8JdMzy_0dFBMI
Message-ID: <CAAhV-H4bLHQo7tkZt2j_=cai03wFKubV9Bg8LeCshz=ZQEmdag@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 10:17=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 2026/5/21 =E4=B8=8B=E5=8D=888:52, Huacai Chen wrote:
> > On Thu, May 21, 2026 at 10:37=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongs=
on.cn> wrote:
>
> ...
>
> > OK, but I want to remove preempt_enable_no_resched() in Patch#4
> > because all other architectures have no.
>
> As the commit message said, this is to balance the preemption count.
>
> We don't want to be preempted for the entire duration of kprobe
> processing, preempt_disable() is called at the start of
> kprobe_breakpoint_handler(), so preempt_enable_no_resched()
> should also be called at each exit path.
You are entering the panic path, who cares about preemption at this
point? On the other hand, keeping preemption disabled is better,
because nobody wants the "last state" to be corrupted by preemption.


Huacai

>
> So, it should keep the code as is.
>
> Thanks,
> Tiezhu
>

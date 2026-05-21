Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10533D9041
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367952; cv=none; b=qeDQC1+lKkuVILGmYbuvtxiMEeZEId7t++TzJcIQp2r7mp98ueAlDXOTC/FJ8oGI8WtDH6yKOa3nW1GrFvycCkFYdxQ3mEKIugdgVtXe/RfBsH603wb7aJYJ0uwtSjdX96VKD/YGhyyzmJyHAwSO3trmz4z430Sc+ixsDTzVlsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367952; c=relaxed/simple;
	bh=nxw6pQ8R1lDze51fdB+4jD51lSdVVIhYCaEtNesQJtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3nhG7E2noUZwiWsDWrZ6rAANZI9WpBqAh/bbXWMkm0uxBbtoSfFLCtJuJlNNEeH2xVqOXEtH4xlnuqymDg57/1Ehg6kY4T2LaoyorMKqt8CvVXHUVvnue4wXMH0gylfE0M6NXVu7R4CzvMOkHlo3BDi1CVIemZSmfz4udNf004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsgzGnQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsgzGnQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A3C1F00A3E
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367951;
	bh=Qme7Xi5tZIxThk8jInZDdSfZ2hWJBFRP0ebawcYkIAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EsgzGnQq64AwrDT7ODfhEMG2IXJQ9ibRBwm+uxurd8pVfj4YOZfovNZENAiBCzwGe
	 Sa2j3nJUMOLb6p1qRrnuNza3RiQY+a7oPmBD1P68r7RweAHs40xDPcPSOOV4ytbQdz
	 YMtpNATep6IAbyZZyB8q8IyaoKjNw2oPd6L5sub7ha4Y7U05ri9jdf5e6ThkpSPc58
	 aeY6yr1E4O0E+r0HsAU/aXz0zzuhPhVzGfIVYgTgq9b8z1xTL0Dy3TBD/VcFbCHEXY
	 SDcx0CQmHBAp/OpbWmGxJYu3L1WgylM8cBmqUWtvISotNDOji+4QviE/cXMFjX2XP0
	 oxAYT0QGFBNJg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd56d108454so1189319666b.2
        for <loongarch@lists.linux.dev>; Thu, 21 May 2026 05:52:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93ydDzFj4YdPkBcddB1SzeRr+BqhypSUDeFr/RONg1BmMvFu2Wo+2drkqZoHnsrdbW6olfQJwZfAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlIgNe6Al/1a45NS5x1UTROsPv4q9Ksiwe7122+znTQc5MXnG9
	CrkWYzvDW8TIPfnU6SpyUqYq0Q9QXCnzrwTheyrZL5nC+EGqmq6E6+nWzBHGoHdWJO2i19WOwoP
	Y74XlKZ847ag/jqV7NxWryzbrX1tGkXE=
X-Received: by 2002:a17:906:7950:b0:bd2:aeaf:470c with SMTP id
 a640c23a62f3a-bdc1505b2admr167164166b.40.1779367950050; Thu, 21 May 2026
 05:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512082029.2131-1-yangtiezhu@loongson.cn> <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
 <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com> <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn>
In-Reply-To: <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 21 May 2026 20:52:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
X-Gm-Features: AVHnY4L-Wj8YocOHOSsZ1OK2fqK0CPyXS1mckAb6nHFYlcVKGkQ4dtVh94YhTHQ
Message-ID: <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 10:37=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 2026/5/20 =E4=B8=8B=E5=8D=883:58, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Fri, May 15, 2026 at 12:29=E2=80=AFPM Huacai Chen <chenhuacai@kernel=
.org> wrote:
> >>
> >> On Fri, May 15, 2026 at 10:52=E2=80=AFAM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> >>>
> >>> On 2026/5/12 =E4=B8=8B=E5=8D=884:20, Tiezhu Yang wrote:
> >>>> This series addresses ftrace and kprobes issues observed under heavy
> >>>> tracing loads.
> >>>>
> >>>> Tiezhu Yang (4):
> >>>>     LoongArch: ftrace: Fix stale per-CPU kprobe state after task mig=
ration
> >>>>     LoongArch: kprobes: Use larch_insn_text_copy() to patch instruct=
ions
> >>>>     LoongArch: kprobes: Fix single-stepping instruction slot prepara=
tion
> >>>>     LoongArch: kprobes: Fix handling of fatal unrecoverable recursio=
ns
> >>>
> >>> Hi Lisa and Rui,
> >>>
> >>> You are right, please ignore the patch #3.
> >> I think Patch#3 is OK, but you need to remove the introduction about a=
tomicity.
> > Will you resend V2? Or just ignore Patch#3?
>
> I think no need to send v2.
>
> Please disregard patch #1 and #3,
> I will tell you more info in the inner meeting.
>
> Please only consider patch #2 and #4.
OK, but I want to remove preempt_enable_no_resched() in Patch#4
because all other architectures have no.

Huacai

>
> Thanks,
> Tiezhu
>
>

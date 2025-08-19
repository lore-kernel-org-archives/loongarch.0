Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F726E173
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594397; cv=none; b=NwgkVdfY3Zdw8nDRr62zOD6zLo33urkGY0zZAGdd+LD/zA6VlJ2LbrbtevNCGa2fNA0Xhe46kTuiCjafpetfPRMF2lrbGwBbOThCAFo2TPw/flOTRhhpfMos7h59UgBwVXVj961xpBu5ZZKUD3m/WXY43q6MFhpjB5tGNsrQx2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594397; c=relaxed/simple;
	bh=cz/9GTvBj9WEIjBElq6Usz4t/NABHId3D4ykDBBeQ6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu8eCTIbCbyPHROUcPnjZGPImOT0DUOu67lbnwy5GKr3/I1WhvDdKJNyuNgFaCOBPs043MqKz50C8ZQPlwdKo7EhJWtPH/na16f579oO7BZwsKyEWtSb9FWgbVCCyQmqnCbSRH8xND1fTeqV4+79CsLIGlobsaS5rsF9htNX6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwE9hyLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwE9hyLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F17C4AF09
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755594397;
	bh=cz/9GTvBj9WEIjBElq6Usz4t/NABHId3D4ykDBBeQ6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SwE9hyLx8drPWr9YoV+jp3O4p6XXVGnHV1cC1rRFiOkGYimsoAeiSWRl2Y9kmWpOH
	 MSxDFDrnLlZN4B1o9BEo/9PMkflQdfNr4PtSdyu0cTDYvxD0tsTQEwjxr4AwL2H5oF
	 rfxFoPS9RqoqzmEWCBx7rSaib33XsnWY+WOfNsqSK0oCHN9F80+AGdjc/1DuKcKt2b
	 MsDRvK1PRKwKjIY1jNH3QHOgpIIoCndtP+JvvcRj4BFw7JFlhRGjYxtzjFbYzvdhYD
	 V+gwQK8VmucU2bfdGGQGWGOUIFUxlWLZj3He3piN2ZMB+FvKGdJfWPO2E7WeoQFrsh
	 5qpTeAVMI3EcQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61a2a5b0689so4180779a12.1
        for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 02:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLFOra+aKKoZ2nsIgCcaALxFVSyEDE58unD+IH0ZOer/FyQqL7wuSUcEP3gINMO1auyFQq73CRyfw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt6ogzJ9w3sfhxccd7s8lxQB5aerm9olcewaZXyPgucHZMiHZr
	ZLE6VbVwoFYlDgh6Q265StOT0KFRnvrblxn4VDVOf9CRGtRj6N5j/GVLlCUR+xzaEORKX8Sdi6H
	jJ3QjtZE5/9Jki9oh+I9GRYGmOaACVDg=
X-Google-Smtp-Source: AGHT+IHPDH4CM8c9ghdnY52oeNouL5sXBeIBZiZUfseAy4pTcxWshWDGcVyrWRU1hXUV/P243y1lYxcF4jDTGz88988=
X-Received: by 2002:a05:6402:42c3:b0:618:161c:6bf with SMTP id
 4fb4d7f45d1cf-61a7e72ffa1mr1445241a12.19.1755594396037; Tue, 19 Aug 2025
 02:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815082931.875216-1-jianghaoran@kylinos.cn> <720482db-17de-4831-b64a-0ae3fd7fa5a5@iogearbox.net>
In-Reply-To: <720482db-17de-4831-b64a-0ae3fd7fa5a5@iogearbox.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 19 Aug 2025 17:06:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5GxL159jSD1V6G7JZVXasESVFr02Jj=h+mYUU2374N6g@mail.gmail.com>
X-Gm-Features: Ac12FXwSpVqveFcgoJVDNQJOBGpUpjERIlW5CiAQGrP9HxYCEErpcoLyEQ7FORk
Message-ID: <CAAhV-H5GxL159jSD1V6G7JZVXasESVFr02Jj=h+mYUU2374N6g@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: BPF: Fix incorrect return pointer value in
 the eBPF program
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Haoran Jiang <jianghaoran@kylinos.cn>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	kernel@xen0n.name, hengqi.chen@gmail.com, yangtiezhu@loongson.cn, 
	jolsa@kernel.org, haoluo@google.com, sdf@fomichev.me, kpsingh@kernel.org, 
	john.fastabend@gmail.com, yonghong.song@linux.dev, song@kernel.org, 
	eddyz87@gmail.com, martin.lau@linux.dev, andrii@kernel.org, ast@kernel.org, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:24=E2=80=AFPM Daniel Borkmann <daniel@iogearbox.n=
et> wrote:
>
> On 8/15/25 10:29 AM, Haoran Jiang wrote:
> > In some eBPF programs, the return value is a pointer.
> > When the kernel call an eBPF program (such as struct_ops),
> > it expects a 64-bit address to be returned, but instead a 32-bit value.
> >
> > Before applying this patch:
> > ./test_progs -a ns_bpf_qdisc
> > CPU 7 Unable to handle kernel paging request at virtual
> > address 0000000010440158.
> >
> > As shown in the following test case,
> > bpf_fifo_dequeue return value is a pointer.
> > progs/bpf_qdisc_fifo.c
> >
> > SEC("struct_ops/bpf_fifo_dequeue")
> > struct sk_buff *BPF_PROG(bpf_fifo_dequeue, struct Qdisc *sch)
> > {
> >       struct sk_buff *skb =3D NULL;
> >       ........
> >       skb =3D bpf_kptr_xchg(&skbn->skb, skb);
> >       ........
> >       return skb;
> > }
> >
> > kernel call bpf_fifo_dequeue=EF=BC=9A
> > net/sched/sch_generic.c
> >
> > static struct sk_buff *dequeue_skb(struct Qdisc *q, bool *validate,
> >                                  int *packets)
> > {
> >       struct sk_buff *skb =3D NULL;
> >       ........
> >       skb =3D q->dequeue(q);
> >       .........
> > }
> > When accessing the skb, an address exception error will occur.
> > because the value returned by q->dequeue at this point is a 32-bit
> > address rather than a 64-bit address.
> >
> > After applying the patch=EF=BC=9A
> > ./test_progs -a ns_bpf_qdisc
> > Warning: sch_htb: quantum of class 10001 is small. Consider r2q change.
> > 213/1   ns_bpf_qdisc/fifo:OK
> > 213/2   ns_bpf_qdisc/fq:OK
> > 213/3   ns_bpf_qdisc/attach to mq:OK
> > 213/4   ns_bpf_qdisc/attach to non root:OK
> > 213/5   ns_bpf_qdisc/incompl_ops:OK
> > 213     ns_bpf_qdisc:OK
> > Summary: 1/5 PASSED, 0 SKIPPED, 0 FAILED
> >
> > Fixes: 73c359d1d356 ("LoongArch: BPF: Sign-extend return values")
> > Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> > Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
>
> Huacai, are you routing the fix or want us to route via bpf tree?
I will take it, but I'm waiting Tiezhu's Ack now.

Huacai

>
> Thanks,
> Daniel

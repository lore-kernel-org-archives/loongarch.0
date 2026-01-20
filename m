Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A283421890
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914102; cv=none; b=BO/fQIW3Xib1UuRp+nDqs9aHOFzgyK9SuW3a0bvMc3n5+TYdO8Om/JX8U9XWyenC6CYnlx53+0cnrkx17b/5ZRJ6t1Ll95HVFbg3kRv+IHm1batdfHwyhUPW7gzaO74ELdRt06nsZVHuy0DpqPxb7HJU4Vn5ItCEUVmDqmpliR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914102; c=relaxed/simple;
	bh=slM+y9l+5JZj/yJvSGw3eBP4fn01lNqhWr3QLD2/eto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxbcahFe1n167ABSKZ0XcACN1mWbIGLKy2Burwf9o7gflduSAuB9KHMTcSGJNIgIHIN+kQz5XdZshapi7ePyzICwvwVHx3cMEBNr4Z5IhX19SKT0NKlt23pvR2AySxp+PIDPJ0QE5/xENKmO0jIc1lcGEOUCmWsZ60Gkgzox4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJOHofIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJOHofIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C925CC4AF09
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768914101;
	bh=slM+y9l+5JZj/yJvSGw3eBP4fn01lNqhWr3QLD2/eto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJOHofIK/iEu9lxzYvLyf4dRooeG+j6f/7rpTkdgqbuHT9IX3egkaLpj2AajpNPy4
	 KMsgS9R33507sxQCfuKyJr5Sp5sb1/e6m31aAPGoqxbOTZjlg6n0sW8nShhC2psKrs
	 LgahQMLppeAp91+MEIwE6Lnodj3JYihirjpMw4yB/aP0nmG/hW1vaC6D0KlBVF1knr
	 zNDTR5op9fRsRf3vT8NeT1KmUEgKOKMy1EysvLQSeQ0s+hwQwsvOgH3SSYlml2niKL
	 /GWJb+bo3CkKg9XWdW+Tz4lTV5eBdC96tp5rtYwwKZNvjr/BJBliUVPRuDAR00ZKVi
	 0D8jmdJxP1slQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8765be29d6so757785766b.0
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 05:01:41 -0800 (PST)
X-Gm-Message-State: AOJu0YwaHv9MLjSDwxph/2lCS2vkJKC9go2wH/y/CTmRrtFhY3WQNlPZ
	GVUpB9punYSKooHMiw5YDvDG6b4Q/wZVkekFxW7/La+EHyvmLi7Ygcl6DHpbXkqzsNU++WdUu06
	6hPMBzgft+m7mq3Y+d8clOHuIheqN+Xw=
X-Received: by 2002:a17:906:ef0b:b0:b73:6f8c:6127 with SMTP id
 a640c23a62f3a-b8792d3be24mr1460281566b.12.1768914100382; Tue, 20 Jan 2026
 05:01:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120092331.813-1-yangtiezhu@loongson.cn> <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com> <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn>
In-Reply-To: <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 20 Jan 2026 21:01:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
X-Gm-Features: AZwV_QgEA7cqq12mut9U_10MxpDfMT0jH73qdz4NYR3c-XbVmTtNHBBzFNy9VrQ
Message-ID: <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:57=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/20 =E4=B8=8B=E5=8D=888:04, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Tue, Jan 20, 2026 at 5:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
> >> ORC unwinder"), the system can not boot normally under some configs,
> >> there are many error messages "cannot find unwind pc at".
>
> ...
>
> >> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> >> +       for (int cpu =3D 1; cpu < num_possible_cpus(); cpu++) {
> > Use nr_cpu_ids instead of num_possible_cpus() can improve performance a=
 little.
> >
> >> +               int vec_sz =3D sizeof(exception_handlers);
> >> +
> > It is better to add "if (!pcpu_handlers[cpu]) continue" here.
>
> If so, it can use for_each_possible_cpu(cpu) directly?
It can, but I remember you want to skip CPU 0?

Huacai

>
> Thanks,
> Tiezhu
>

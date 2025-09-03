Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C362F60A7
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911377; cv=none; b=CodO4T675GJPT/NlbKLIwrnqc535Ai30iwG2k4dNrn6pvZw1h3QZ7X8xUEIitxoEbZQ8BAFmQ5wdl9ZfX3lYviJGKpsU/iXI9LTuUc4j5d+JtN3BQsUa/lOogbA293DIwYyiXlskA4QBfm1cm5Vz2xb+6sGNC47mwBxq9VmdSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911377; c=relaxed/simple;
	bh=tIj0Z+DTJ39YmUSL3K3XPXx/F2zAbmRduMb/bX0FT0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLY5dF1Ra7y3bI3h3nLbiI/votdhendbZXSwbGvwDBVavpudeDuBW8mUbNv1FqR5pA+9A9xWFD7ou8DkUkuUjdTgilhqd78JUTZS1GickVDrUP3OOENPp3LYos2V+n+a6eNxGhlyXSp0bsIu3HtbKW7wP0HcqZIkZYWohsTT9OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYcabpiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYcabpiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A2DC4CEF0
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756911375;
	bh=tIj0Z+DTJ39YmUSL3K3XPXx/F2zAbmRduMb/bX0FT0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uYcabpiXBsMXHQsj5wpLGVmv80yreJZyt9i8IcopCdOx0vZdyYtgxEUiOUXPkO84j
	 aOcRPVm9WX57mJ/tgYnmc2YvK8BsJDVkotHa0Q4WYM/S95BGlL8S98WG54lGdkjO+Q
	 B2vvf05v/UXHbodQpKaV03CYGhlxe5/DJX/Jx2BxZIOE2V8Xy/RCotiYV28RR2UXN2
	 tXPjJuWZVGDObaBMCxSP+V41o6uXKDTEmuG4bLgVkPNyObcrWoOLWivz4ZBtoYppK5
	 h8msV8KNE1hnIlji0JhohkPyUf2Ljawr7kPJPv9VW5DlHVACP3ecJPzvrWeEK8dBxF
	 +9rHbRCjcyDBA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61e4254271dso6223416a12.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 07:56:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGESTCIAVQSdDOVEDEfLsVr10tPPBjPLaQOJwYdB7652uB2X0yBiYEFcIzOAc3UAui5Id3cHjaNUc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+PShPcHkaOxgo3ubPUWq9dyQiU2VnsC7NzvWyL8qiE6gVqEnQ
	Zbz2lDBnV1NP+EOpxtgJpkzBi3coJopYQu6kNb8+DWDeSvmXbQ0j/jsqjXDUPNurQJN31+tOa+T
	KE6UI2fYv7qJVo2KUuhisONpyJ1Xu69c=
X-Google-Smtp-Source: AGHT+IE/LR48GB5PXHUyXlgQN5d5j+LDUGmvSVQKVgj1NaHdjQ4F+nQJz/y0FnAx1FoJMmd7o/fE4B1dCE3EM5yDCH4=
X-Received: by 2002:a17:906:c111:b0:afe:a446:b22e with SMTP id
 a640c23a62f3a-b01d8a277bamr1555805266b.12.1756911373705; Wed, 03 Sep 2025
 07:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903070113.42215-1-hengqi.chen@gmail.com> <20250903070113.42215-6-hengqi.chen@gmail.com>
In-Reply-To: <20250903070113.42215-6-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 3 Sep 2025 22:56:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5PkWkhnBWEynxJki3rbN6rh_HW1hmVUY+ixY0Gx+ot+w@mail.gmail.com>
X-Gm-Features: Ac12FXy6uYcWS4k8gsz97tFti1aoMm3hFKJp5EYEa2tM3SdU5Vr5jNyS3XB9jq0
Message-ID: <CAAhV-H5PkWkhnBWEynxJki3rbN6rh_HW1hmVUY+ixY0Gx+ot+w@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] LoongArch: BPF: Don't assume trampoline size is
 page aligned
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hengqi,

On Wed, Sep 3, 2025 at 8:06=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> Currently, arch_alloc_bpf_trampoline() use bpf_prog_pack_alloc()
> which will pack multiple trampolines into a huge page. So no need
> to assume the trampoline size is page aligned.
We do the alignment because larch_insn_text_copy() changes page attrs.
If there is other data and BPF trampoline is in the same page,
changing page attrs may cause errors.

Huacai

>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 35b13d91a979..43628b5e1553 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1747,8 +1747,7 @@ int arch_bpf_trampoline_size(const struct btf_func_=
model *m, u32 flags,
>
>         ret =3D __arch_prepare_bpf_trampoline(&ctx, &im, m, tlinks, func_=
addr, flags);
>
> -       /* Page align */
> -       return ret < 0 ? ret : round_up(ret * LOONGARCH_INSN_SIZE, PAGE_S=
IZE);
> +       return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
>  }
>
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> --
> 2.43.5
>

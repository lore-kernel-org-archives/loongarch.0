Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1E235BE2
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773561943; cv=none; b=VrQ9lVe19PBv/Yz++AFTyteaNuv7n2Dm5OIUjv+c8REVcuYxwtBg4mx9a7xE+MAm2z3tHoofQPuqMmn6Hn4bSk8SqrRqPCQCoTgVbjgPWd5EJmpr1yyzDAlsMN9xMITl09GAgZqWpRMfiEd0RuizXoQOD2rzgmHxMZB1VEQoGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773561943; c=relaxed/simple;
	bh=uSdlNollIQrORdPKBVxzBHrEePBnVW2+7fi1oqjltOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWKNGxEZ0bbRfPqrsAnC25xCj+OH9eqPFnA5vQphwF3n2U2V4KTgpasrXmM0htShwhyFAUtUMoqLslJsgfl8DwKvLNIadVJU328it9/kVoH7rSafTRQvuN0O4RR0ef2EolJPgIgLQ7wmSXEDXR+bKeHnB1479uW5VyhtqQ3mMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv1NtGGF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv1NtGGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A721C2BCAF
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773561943;
	bh=uSdlNollIQrORdPKBVxzBHrEePBnVW2+7fi1oqjltOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cv1NtGGFBCZwWe4W7U5gq6wwCLmc6zkLYrpqkHQjjg0M/cL6Qv4gU2nSjqhjDwcwn
	 0bFz8TSERaePwj5yda/yr9GzO/GsK2VuyDUu0rpr/0Cj0WowrxH+W7nRzNGPKdmWD8
	 Spto/YNlFC+Wj6ejafqOYTW/lSDKEdDmAnzithFSwUb6KN3QnPpiAh14dAZzQ/Kk1B
	 G6UNdx2gNHAPxgRuqAe3CX3w4241LayVQHTGjlJA/CBf0tU75r6DOPaSKow2fe1+rT
	 YQXQMG0dzvlh1vRF8pC7XMUULNyH7dy2vr0aGwwl+/0qjMWAvoJZQUlxZl96Sgtkn+
	 gtTNkgK4lXbfg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso140802366b.2
        for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 01:05:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMrcgICmwyswhFqoq/+zgqjA9G9+ydCXv4pvGO6aG8tA+Vzja/
	CnZmljnMlRVj513uoiGAd3tpf2NQ8jFtYtngTE/hfmZO9xmLQLpZYDh2ptOrAS3CgWDg/yWOXEK
	V8tiCeZI8II9ipIF68BdftsLZLnP0PuU=
X-Received: by 2002:a17:907:7288:b0:b97:a0e3:3d92 with SMTP id
 a640c23a62f3a-b97a0e34485mr152372266b.51.1773561941452; Sun, 15 Mar 2026
 01:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310065510.8189-1-yangtiezhu@loongson.cn> <20260310065510.8189-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260310065510.8189-3-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Mar 2026 16:05:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4S-gx5N5_kGnO_y7etDDstgMyLY2i28=i9w_CaknF8yQ@mail.gmail.com>
X-Gm-Features: AaiRm50iM2I032ZgoO9TREJsyzYM-thMNs1PR1E1LbUfge0TEjl6RDOkXf63lZo
Message-ID: <CAAhV-H4S-gx5N5_kGnO_y7etDDstgMyLY2i28=i9w_CaknF8yQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] LoongArch: Check return values for set_memory_{rw,rox}
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with small modifications, thanks.

Huacai

On Tue, Mar 10, 2026 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> set_memory_rw() and set_memory_rox() may failed, it should check the
> return values and return immediately in larch_insn_text_copy().
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/inst.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 7545ae3c796e..77da3b886dcb 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -258,6 +258,7 @@ static int text_copy_cb(void *data)
>  int larch_insn_text_copy(void *dst, void *src, size_t len)
>  {
>         int ret =3D 0;
> +       int err =3D 0;
>         size_t start, end;
>         struct insn_copy copy =3D {
>                 .dst =3D dst,
> @@ -275,9 +276,19 @@ int larch_insn_text_copy(void *dst, void *src, size_=
t len)
>         start =3D round_down((size_t)dst, PAGE_SIZE);
>         end   =3D round_up((size_t)dst + len, PAGE_SIZE);
>
> -       set_memory_rw(start, (end - start) / PAGE_SIZE);
> +       err =3D set_memory_rw(start, (end - start) / PAGE_SIZE);
> +       if (err) {
> +               pr_info("%s: set_memory_rw failed\n", __func__);
> +               return err;
> +       }
> +
>         ret =3D stop_machine_cpuslocked(text_copy_cb, &copy, cpu_online_m=
ask);
> -       set_memory_rox(start, (end - start) / PAGE_SIZE);
> +
> +       err =3D set_memory_rox(start, (end - start) / PAGE_SIZE);
> +       if (err) {
> +               pr_info("%s: set_memory_rox failed\n", __func__);
> +               return err;
> +       }
>
>         return ret;
>  }
> --
> 2.42.0
>
>

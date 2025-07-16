Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901982F4309
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752666960; cv=none; b=qY9n5WokW4pYvPgH9fvvDh3/jmcxoRp7hwyO6t4RdljqOfjfAr9xMaldoHzxBm1g2TMM1w5e01WZKhISoeR7M8gIqYG6iLWOn+UfR4yMD6ykx0nRhqao7grqMVinj5iK6XVkuyHPQSGcQTQcfZzKCFY57U/4MBrXWpwieHXNX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752666960; c=relaxed/simple;
	bh=46KRWc6CL8rDgHI0Ds+dVS1e/7PnwHqn6Cb6seF0cFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=debzadqBzkbcLp1HTKZ46qFuOiQU8dBvbTMRB94Jw62w2vyOnMRY4dGrXMpp3G4x8QUFnvPdkNjkafgpbDM4dLoBkG7cXe6/x7xybQQD6GP3lIUwjswf6tM3Kn58RJSzpmJyTF+sKkOX+KvS7aHOcTz0tUco7p6CEdBNx1H8hxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwaRKoUP; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwaRKoUP"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60bd30dd387so3060186eaf.3
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752666958; x=1753271758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgpuWStD+g9XlsGil0a2qM7CDtMSHNw/qYVDjYHubzs=;
        b=RwaRKoUPFSsXJw3osWHiL9YY1+7m/YTIoMCXTE+w6RYbBBWoez+vNy3u6oZuCFobio
         MCmnubk3Ia8i61FvxrBe7aFFR/7hX7rSNEstOmizDW+kGNBRw124Y0VELWeONFoXmBMt
         gBlY8VDiS7Epghuif0bwS2Qhl5TI8S0AoiAvMlWJRBE/D3yKOdya8EGNmRo9tgH4zhrS
         YOxrgpc2M8nKGgqt0zo1uAStYQjiVQse9jacN+x5VsD3yg5S8+G/vl/oYB4w35WDrRIz
         xbUX59uXsISvhDXBC3s2rutvG9H8qZ4udZWsTGQtki3ScJ47dXpmVo6Z+avy/Q/MgTm9
         B4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752666958; x=1753271758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgpuWStD+g9XlsGil0a2qM7CDtMSHNw/qYVDjYHubzs=;
        b=VQqw2wvYxILfnKWCmdT0OsjJI6MIZBBDm9DH62zCF2odjTyazzxDd487oFuYlcapQg
         thwWzQt8EqsH1S1LiNaPl77M1M6sR9n+Xi4ve341EiQMTADUD6vL4rGDFO1/a6Oy0wKU
         1iP5Y4VFH5rAjDnvOv6cjr7qI0D8fYyJtNpaamGnxFIEceZiGdQWb0QTvE/wt2kj2/Vg
         keHY7W2x755XRv0x7Z4V98gpWx6vx/uUQfsO6xRCGh5sx/3NeWU2S5qiz8hXm7iVW658
         DYVx/hstCLvdKJcMEv+tqE5OkwzuuXN6WiEIpnRavrFmYyFQyRI7s3y85JA4u7lXNzms
         jcVg==
X-Forwarded-Encrypted: i=1; AJvYcCV6skR5r+zgrfdn/tMO+L21SCzPsLkMhi8lSaZ3Q8aUGAlffRusp+vRtungtngxyPagOQDDOecVsvY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb7PossBwVZtMXtcgqAbjskeEF3hqorLoR6qdXudeGpxjKBfSe
	FHmm+W8nk08OlSjqktyB3ER3+LiLu/YWcn9OFzD0bfWeYTigUn4VkAV8SKYB8UfCB+bnL8b/vy5
	nkYml4ZJQnxaQ2v3zztQn8E4QIctO+Dc=
X-Gm-Gg: ASbGncumny8lUTSi29REA/YYLD2RFgMWZpQkt7No5WW7Nmp3SmqmGmbBNg/P5/a/1Id
	LO6bGkGkgMbB8y1J9ALenpA2jk/4VVqE88hLhkzaQjJjN56fGracBMSvjmKk7G+MR//G75Ksb0Z
	Isc1UNGiqXgexQFQ9NuSqMb4G93L4JgUBbKabgGWDHqipCQf+YiUocMB6ydMLuBUef/BtQFfah4
	xskQH4=
X-Google-Smtp-Source: AGHT+IETKnvezmKlq+zmC9uwg6Ch1WE6f4Jt7hYDCbTCtYguhAyXT7+KyCQsYA1VXTT6YMNAqwQVB9dyT+azQ5SC4qs=
X-Received: by 2002:a05:6820:1e03:b0:611:a799:cb65 with SMTP id
 006d021491bc7-615a1ed3996mr1490965eaf.2.1752666957689; Wed, 16 Jul 2025
 04:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-3-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-3-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 16 Jul 2025 19:55:46 +0800
X-Gm-Features: Ac12FXz_Ud4KBSmMLY9gQ2gi1DdYRSZe-UgrRD1--igSRHmSf1PEp6zyl_Z6UoY
Message-ID: <CAEyhmHSs5Ev5LBp8KWDnK93NcJnfvVZPy=X80Miy9PnP4rMA=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] LoongArch: BPF: Update the code to rename
 validate_code to validate_ctx.
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> Update the code to rename validate_code to validate_ctx.
> validate_code is used to check the validity of code.
> validate_ctx is used to check both code validity and table entry
> correctness.
>

The commit message is awkward to read.
Please describe the purpose of this change.
* Rename the existing validate_code() to validate_ctx()
* Factor out the code validation handling into a new helper validate_code()

The new validate_code() will be used in subsequent changes.

> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fa1500d4a..7032f11d3 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1180,6 +1180,14 @@ static int validate_code(struct jit_ctx *ctx)
>                         return -1;
>         }
>
> +       return 0;
> +}
> +
> +static int validate_ctx(struct jit_ctx *ctx)
> +{
> +       if (validate_code(ctx))
> +               return -1;
> +
>         if (WARN_ON_ONCE(ctx->num_exentries !=3D ctx->prog->aux->num_exen=
tries))
>                 return -1;
>
> @@ -1288,7 +1296,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *prog)
>         build_epilogue(&ctx);
>
>         /* 3. Extra pass to validate JITed code */
> -       if (validate_code(&ctx)) {
> +       if (validate_ctx(&ctx)) {
>                 bpf_jit_binary_free(header);
>                 prog =3D orig_prog;
>                 goto out_offset;
> --
> 2.43.0
>

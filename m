Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE723EAB3
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 03:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773977360; cv=none; b=C4kX8L3Cyt0n0ka6djpIbhNgAeDj1ysZIQzslwEdgcUT+GfETPR4swi4PdcBuCb7+9AbTaxgc8FX52nwoFKO7/ofYFJLZlcOfyUkVA9KZZq3zCLBObHnUU2ovGYA7FoTaxvW99cWbDJ0L5MbLWrPT+aw5Uar4sU4+3AUKg7LTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773977360; c=relaxed/simple;
	bh=a0aGeD5ccGq8zx1IlDeTIxlMzWLOfY0HTmUE922hIZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIGdN3+RqtZufteMt4+oHBHsMGF28eoZsW0KnwI6fRl5EVdI7AjgBRvFUX7xTp3cF33NS3GHsW4dt927qNJkK/3z+7KklKUbXgPpvSLsmyj+ua9rN/rdClZf59wsrBqzaHGsZbq2f82EkmYInNtKiB+LmMFF9gMSDSvZPcgs9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LT9CM3OI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LT9CM3OI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72526C19424
	for <loongarch@lists.linux.dev>; Fri, 20 Mar 2026 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773977360;
	bh=a0aGeD5ccGq8zx1IlDeTIxlMzWLOfY0HTmUE922hIZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LT9CM3OIDEAD0YS+9SF5gjt3az7B3KxqE5Xkq8KFz30efxMMt1yDo/iXUVg9+TTAR
	 2URFXVgpiFrm+MH9U4/xE+Eujt5fc9WQvllD6L1ameA3qGdTVA80j1PxSDSUG0xP8E
	 gLHUg/xdnb1pl7HiSaTqRADjv/I+/TA7dvi2J26it1XQ+dHFjHjhaDv7CsioilcEQs
	 uWQjy64qGASFUBdVXVJs24+5ddDsezqbYL2zvaOocxMaj214H/Ctw+3JjpStDKKcVd
	 Vvxqb6THEnRfNIYAmVMvmJ/zuWPofEpfUrB9E+lFDzXufEWdxggj1FA8ldJN1OSVPD
	 rAmNAF4n+42Ew==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b98133bdc4bso177842966b.0
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 20:29:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YxiDwEkpD8GtrUakuVk2bL7hyTCPe6GwZFnS4krOV3rSI3MxUvf
	Ln3G1oeg0PA89P1MPp8h5VrfF5u7q2xwbtIkh9UhllWX9LjT+2sbxJ65RGjCYEqviGT9ECue2W7
	sMSVaHapPIVLM9mTK8RcIDwrEU8yBdeE=
X-Received: by 2002:a17:906:6a94:b0:b97:98e9:1b17 with SMTP id
 a640c23a62f3a-b982f2f8edcmr66844366b.28.1773977358960; Thu, 19 Mar 2026
 20:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320004725.1927073-1-lijun01@kylinos.cn>
In-Reply-To: <20260320004725.1927073-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Mar 2026 11:29:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7mcb5sMCVH7Yf37cKOkXaPW1h5gZEndhyprZiVqZ6H5Q@mail.gmail.com>
X-Gm-Features: AaiRm50Bqun6yIFh3eww2H3mEhq2PI8LQK1Vqm8uhtxfBpEy1Eppk8JMrYTEBGQ
Message-ID: <CAAhV-H7mcb5sMCVH7Yf37cKOkXaPW1h5gZEndhyprZiVqZ6H5Q@mail.gmail.com>
Subject: Re: [PATCH v4] LoongArch: env: fix missing NULL checks for kstrdup
To: Li Jun <lijun01@kylinos.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jun,

What are you doing? In your understanding, my comments in V3 meant to
tell you to go back to V2?

Huacai

On Fri, Mar 20, 2026 at 8:48=E2=80=AFAM Li Jun <lijun01@kylinos.cn> wrote:
>
> Fixes potential kernel oops during early boot when memory
> allocation fails while parsing CPU model from device tree.
> before return -ENOMEM, of_node_put(root) first.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 841206fde3ab..c586de80027c 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -49,6 +49,10 @@ static int __init init_cpu_fullname(void)
>         ret =3D of_property_read_string(root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname) {
> +                       of_node_put(root);
> +                       return -ENOMEM;
> +               }
>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
>         of_node_put(root);
> --
> 2.25.1
>

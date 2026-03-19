Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F03AB268
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909071; cv=none; b=GUXK//SwkBcjtMw3eY3YcF5CyXabsrJUr/VSUv0WdQlRucJ2PcY5I2WmdOji+qxLPU4oMqRGo8OytDR1ASqbjtsCp5RmKUgfdV2n/xMltRlHnwZ9JTobN5pOOVZwsEX+NgeUwvh/kNxdi1c/pTyMBkprCOiifIZJv5LhyzSTezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909071; c=relaxed/simple;
	bh=6H5G1xC4Zr8Ca4p5PccYaX/LOaFBKLKfhmTDxX4QWv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4su8Xz5eNR7G4R9RDms2hidlNh5U36xvPfcXkbWZkjovH1fHodDPler6bVC6rWTAcetlsVYeD4xuo2tbFug2fu5CDmVoUZYABFUP6aePiNdDydC3aBL3qdx/bJhbYNbgIJLGp8YDie30LQFWXvTVEK6hGnF1qpdH5y7SgOB140=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scUJLJNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scUJLJNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A35C19425
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773909070;
	bh=6H5G1xC4Zr8Ca4p5PccYaX/LOaFBKLKfhmTDxX4QWv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=scUJLJNuJQf06BIu8DptKH2trEJME6EGn7rOtMVhRpNoko1kzmbrmA8+Ufed/T4Zz
	 8LwC/1KmVTP2n+qpfseFUlR5Umf+3DXMaI7/D//mVx5AF06QMF4qxLQlijiTGyuJsw
	 NcnFsQ9yeTeFbLR008u7qblLXaNAdfGErhJDy/AeXNF4mvG6bfP9Q4/iiDPbFAYK0q
	 2DaQfejrmvUEDj9DxXEHJnbMuTf6LGMNIarqeZAXYPJn7hqmMDYYJVI3vw0tEhVh0A
	 fbDUhd/040KFgesKRJIS+Ayn2fMhXWBaiPBDAhFpC6pNBSJ9BilLXrhs4d+Luz5y6u
	 mWYREYM+NfO3A==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so1259053a12.2
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 01:31:10 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxw7xrf6RTkix2cOKi0Pv0vgZxlMJYWyC4vlYjhOP9YddGK9O8d
	te4HIbQG/ozAjjWo43FOaYd2dEdBxzqbfZICewr7T7wwLOkc7YWWQc2M4EpyQ5TV7ftL24j6ngo
	C7w7oIhRXhucBfh2JSQDJ5Jf5Xi8aGXM=
X-Received: by 2002:a17:907:3cc1:b0:b97:a459:b66a with SMTP id
 a640c23a62f3a-b97f49248e8mr406602266b.25.1773909069427; Thu, 19 Mar 2026
 01:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319055801.4187615-1-lijun01@kylinos.cn>
In-Reply-To: <20260319055801.4187615-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Mar 2026 16:31:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q2U2eNQFZmrOz9qATJhd3ri2SDpfA2ZHkazx5vLCxtw@mail.gmail.com>
X-Gm-Features: AaiRm52kvMg_F97WYf8pmPx9vD0a3fvOnALu5y3s1UeKvij-mrzfghW_CBsavlo
Message-ID: <CAAhV-H6Q2U2eNQFZmrOz9qATJhd3ri2SDpfA2ZHkazx5vLCxtw@mail.gmail.com>
Subject: Re: [PATCH v3] Loongarch: env: fix missing NULL checks for kstrdup
To: Li Jun <lijun01@kylinos.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jun,

Please replace Loongarch with LoongArch, and...

On Thu, Mar 19, 2026 at 1:58=E2=80=AFPM Li Jun <lijun01@kylinos.cn> wrote:
>
> 1.Replacing `of_find_node_by_path("/")` with `of_root` avoids multiple
> calls to `of_node_put()`.
> 2.Fixes potential kernel oops during early boot when memory
> allocation fails while parsing CPU model from device tree.
>
> --Replacing `of_find_node_by_path("/")` with `of_root`,
> Fix missing NULL checks.
Why say it again?

>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/env.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 841206fde3ab..2afc9b09f139 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -15,6 +15,7 @@
>  #include <asm/loongson.h>
>  #include <asm/setup.h>
>  #include <asm/time.h>
> +#include <linux/of.h>
I don't think this is needed, we already use of_find_node_by_path in
of.h, which means it has already been included implicitly.


Huacai

>
>  u64 efi_system_table;
>  struct loongson_system_configuration loongson_sysconf;
> @@ -42,16 +43,15 @@ static int __init init_cpu_fullname(void)
>         int cpu, ret;
>         char *cpuname;
>         const char *model;
> -       struct device_node *root;
>
>         /* Parsing cpuname from DTS model property */
> -       root =3D of_find_node_by_path("/");
> -       ret =3D of_property_read_string(root, "model", &model);
> +       ret =3D of_property_read_string(of_root, "model", &model);
>         if (ret =3D=3D 0) {
>                 cpuname =3D kstrdup(model, GFP_KERNEL);
> +               if (!cpuname)
> +                       return -ENOMEM;
>                 loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
>         }
> -       of_node_put(root);
>
>         if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname=
, "Loongson", 8)) {
>                 for (cpu =3D 0; cpu < NR_CPUS; cpu++)
> --
> 2.34.1
>
>

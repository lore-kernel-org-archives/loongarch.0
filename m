Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1EF1FC7C5
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347373; cv=none; b=qaPApkoSdQABAW+hcz1fFjKJLbr4xFiJjOAlmM2xA//M/m/1qnciYEQlvtYGDswgaZ3iT26OZqA5YlQpGLv1EdZBfhMkluX+mtvZMf2bcVTbwMCGWTPtoDwzpwFd1+VHcO4ikDMpvWkmIx7kVcAcydWHGDQeVMi6HtcHIjfHm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347373; c=relaxed/simple;
	bh=/3gr87xL2Snp1ckqYw8ICoQH4w94eL0K9aCCvJUZrwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOG1NouNlYMIClqMH8gjbGXQru1II+uYBZIe4SchK56j/TUw0B5awWX/AoOcGosDDAGqg719e2OGr3zt+q9F1soPtQvibWxrLDgT1/icetI+vhGzq55Yq/BKCHANgXZ+hY6bLl9leQIXGGuJKY8f8Ug0g0UfPowi6KOMFuDlHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQeYxumY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQeYxumY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9C11F00A3F
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779347372;
	bh=DL3k59AvmDgKGPZJsEyuzSgm0PbQI5B1EiOCPjanQ2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PQeYxumYa4wG3UsSMDXjbsZkczFItosD7NDEjmpKRiLrSzdH5lMBHJbLLbu4KzwDm
	 rhtIcIiB8tM4IGi0IrBnOB4vD4pWZzdRPHdwd0ytnxrz6ZSJQBL0ODKLsKQPIrFp+k
	 /uQHEdd44L5SgWe6WsJ97aT80xCmBfFRTifTQ18elvMvv38A9GZby8bnifAjVQg63O
	 cOqA+mOiaTQ5nRSfy1Izbeq493Az/Qp3IGCX7NBy6v7X5Zspo/UOhH4QZf1TTli5tp
	 15CjRVDylXtlLHV2RdoJuIM8THmNcmlhwkt42NYMDsfF5/V08RyhyG/iZpPFGJtvkg
	 fe0BdYLoY7AGQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bcda7765d64so1266732966b.1
        for <loongarch@lists.linux.dev>; Thu, 21 May 2026 00:09:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYYhjESTAAbR+BUZavc4UY+WCWqwtCt8p0ZUw9UhmTSEcZUL/k
	8EoXfs95tmg5bSDLrlIVxp7QWcxMFvBDziPr3XQA8uB2zjtCPHPUxOL0UHF+c3NTupTRqtDdY6u
	qL2emt+HQrOKbMU+IdAtH7wn3IxqcvuE=
X-Received: by 2002:a17:907:8691:b0:bd4:8286:466d with SMTP id
 a640c23a62f3a-bdbffc5fe5cmr88596466b.12.1779347371104; Thu, 21 May 2026
 00:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521063310.52926-1-dongtai.guo@linux.dev>
In-Reply-To: <20260521063310.52926-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 21 May 2026 15:09:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6-apTue-3KCe1sh2LzBicL_3TGvOSSwQAWY0jdk4YgMw@mail.gmail.com>
X-Gm-Features: AVHnY4K2Pw2PhWvEGrn2EcwndvYurJeJ1fYIx2E8utEBKxKCavTh_rnMnZbLUXk
Message-ID: <CAAhV-H6-apTue-3KCe1sh2LzBicL_3TGvOSSwQAWY0jdk4YgMw@mail.gmail.com>
Subject: Re: [PATCH 1/1] LoongArch: Add missing linux/mm.h include in asm/io.h
To: George Guo <dongtai.guo@linux.dev>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:33=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> When CONFIG_KFENCE is enabled, the virt_to_phys() and phys_to_virt()
> macros in arch/loongarch/include/asm/io.h expand to use offset_in_page()
> and page_address(), both of which are declared in <linux/mm.h>.
>
> Without this include, any translation unit that includes <asm/io.h> and
> expands these macros with CONFIG_KFENCE=3Dy will fail to build:
>
>   asm/io.h: error: implicit declaration of function 'offset_in_page'
>   asm/io.h: error: implicit declaration of function 'page_address'
From which .c file the warning is? I can't reproduce it.

Huacai

>
> Add the missing include to fix these build errors.
>
> Fixes: 0ca84aeaee15 ("LoongArch: Make {virt, phys, page, pfn} translation=
 work with KFENCE")
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/io.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm=
/io.h
> index 0130185e0349..7ff4aa72a34a 100644
> --- a/arch/loongarch/include/asm/io.h
> +++ b/arch/loongarch/include/asm/io.h
> @@ -13,6 +13,7 @@
>  #include <asm/page.h>
>  #include <asm/pgtable-bits.h>
>  #include <asm/string.h>
> +#include <linux/mm.h>
>
>  extern void __init __iomem *early_ioremap(phys_addr_t phys_addr, unsigne=
d long size);
>  extern void __init early_iounmap(void __iomem *addr, unsigned long size)=
;
> --
> 2.25.1
>

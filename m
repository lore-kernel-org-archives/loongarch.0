Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC11489FD8
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999297; cv=none; b=aGe1v+WUsPBJY4lhb4C6DbUxMSXPDal6C2ZBlDFcr7KIPz4KXaiJcE/JGgOEBxXyMytFjXej+ezi4qXlyNHp/xL2LyKny9Wf9LYGsmvagFZukP2cOxKztb+R08hRPfE7rFh8WZBDrgrQu++3chuHr7X8t+7Wkun8a82OIvFjqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999297; c=relaxed/simple;
	bh=zjK7w028s9kx61oIShxj9dEr85uplqEikz0aDEv3VpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLGUopRR7lOJkpGF2hmNRN1LfkgA1kVoCTTopRmhcLaAM2QM8iUMoDIT5DvYy+GAV9x/CFzjuhIVr35ZKVsSWvltp3IcJgLZeaKHIAvT/25hSTrF9nRudFZ+4FZDklnHp8PQsaXVWSiaRFztPf0ze/Bh1MbOP6hUlcigEsbx0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QU76EjK6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QU76EjK6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E1C1F000FF
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999295;
	bh=LY4eeN3OcEEOQ7rAxJo5ki/y/HLeHt43P2YeklF9Wf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QU76EjK6Jcbmy+XdOPs50/HteFY9eLsV1iJn5ej/OSzuhKwmEpM8ej3f62dhiOZwR
	 l5W2T2G5EFqmxE7nirr03aQ5x5Dh4fE4D1xiIjiUVLmD7AmkzztKS9ud04z/TbfMWP
	 ksj6zA8ych+H62N8k3MOqRGGkODIGvom678MVN305IA1HZduisAUvtXMyqgu5jd3b3
	 fWvFjjvw9IEiYUjgj/5lqif+5O2ptGEBydP6Q/hcKfMna9Tq2b411iPP2e0R2k/kWW
	 c9C8vxiCN0AHYXhrx+u1J7J/D1hWkHxq/pMQGNtRRZkv5fCJ2FdVnLaAmsUpz/7uEM
	 tksYL2UJGglzw==
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-786c3d55c99so792100137.0
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLrEpDxHFX2WYpJ9chyuYM9uwtKyJ8g0eZqyQ0OijeJgKS/71O55JiNIF9+5T5qp50IPgYYjk2CR0=@lists.linux.dev
X-Gm-Message-State: AFuF++mEOqxxkcS+jAtsez9HkiNxIrDBf8ERbICV87ASUQgAODwEL21v
	wFEA/fJUtcyb0xu6pGngwxlYPeXzveUoTB+v112trQwlYwvljZyVdzYOftKR6yvR23qIG5FV0hh
	VXY5gLfKDn+wfJKXO2N3LXboBri8ave4=
X-Received: by 2002:a05:6102:5806:b0:7a1:f2b4:dae0 with SMTP id
 ada2fe7eead31-7a55c47c753mr3275027137.13.1789999295106; Mon, 21 Sep 2026
 07:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920091237.136637-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20260920091237.136637-1-heinrich.schuchardt@canonical.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:01:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H50dvw9CiJ1qjNhSddt1C_HzDyz=ADka0CSf=pPYBJjAA@mail.gmail.com>
X-Gm-Features: AcwNN1XkREvYOzDm2lS0mEbytM7gtJLMD6z9HsbMdtvu3BJBS93ACe4dZjSMtpM
Message-ID: <CAAhV-H50dvw9CiJ1qjNhSddt1C_HzDyz=ADka0CSf=pPYBJjAA@mail.gmail.com>
Subject: Re: [PATCH 1/1] loongarch: efi: Set NX compat flag in PE/COFF header
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Sep 20, 2026 at 5:12=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The flag IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and writable.
>
> As the Linux kernel neither has RWX sections nor needs RWX pages for
> relocation we should set the flag.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/loongarch/kernel/efi-header.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/efi-header.S b/arch/loongarch/kernel/e=
fi-header.S
> index 6df56241cb95a..c041dad5bbb6c 100644
> --- a/arch/loongarch/kernel/efi-header.S
> +++ b/arch/loongarch/kernel/efi-header.S
> @@ -51,7 +51,7 @@
>         .long   .Lefi_header_end - _head                /* SizeOfHeaders =
*/
>         .long   0                                       /* CheckSum */
>         .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
> -       .short  0                                       /* DllCharacteris=
tics */
> +       .short  IMAGE_DLLCHARACTERISTICS_NX_COMPAT      /* DllCharacteris=
tics */
>         .quad   0                                       /* SizeOfStackRes=
erve */
>         .quad   0                                       /* SizeOfStackCom=
mit */
>         .quad   0                                       /* SizeOfHeapRese=
rve */
> --
> 2.53.0
>

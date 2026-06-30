Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEED2D0C82
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807928; cv=none; b=o9cAKmTk3HTWLrlns4/wEzcDhZhofZ06kkEFZaK1zklDx3CbwWTkKBqed4Yq1++jNerfkG51rmjHrgHUw09JGqiRSJv5AyxF8HIWGV/BtLMBwZZfARtS9fP6angsTcoG/5STw4yORMoLY1fFKdbgI1VsA+behBVzDh5HYy5ALko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807928; c=relaxed/simple;
	bh=hWrP7VE369+d02oj7SDMsHMoTaSZHw3pSZBRLjS6W9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1wSYfThBZ9FZBNb2kSs1mLYA/jxBHF/fZQugeoJQbR4HU2Xfuc1DqLiKk7B9YhF+Usf5hqHe4e3vgyE9Hxsz8uJP9Z+yZJcOTUm6p2SlK3V13Ui6gPGeREIQigTpsaonTGYYIP1b9FQHilB74B1t+vvZifRuO2wnhJOJHkhuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3aLfAuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3aLfAuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32FF1F000E9
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782807926;
	bh=JTtdTTtLsZUC68GVRzjAtIZTHPz5tCNr1Mr5Q83suFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d3aLfAuRJ5bbuctwv/FBA/2LKkNXAkVwl3JeNsj1p7cRYO6OJ+/aUahNce/UuGaOE
	 cvtWpDkZzp88iqe3lcl7A36NOhIdw1XcZGeuPOf+kbU5t0roWDm9gyPJtl88Eb+v8e
	 TDuL59j8V36egcgconU1x06OMFow2zs/EgTm9rRIHOmb+lZrAYbw5SRjhJe6Qokhw8
	 frvs1HX59DVA0Mcr6RSCFJyMIKF1YYUdVECcIk+7TJJIMVLcPHUi6jBgEL7I37aI8J
	 M2PX1kI5uRCfx2LX1waoCn7AYZIHDvq4NA/nXMHwP2+//mWig/UZzRL/ja7YiEdrIw
	 nH1/68V/wM5Vw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so3703372a12.0
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 01:25:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rof2yO5lSNBj0XQ4B7XHiM2uE/WpPXtzfEjieKdZfjv9iw5Ud4w8Pvv7UJ9YSKrcG2gdxopE4O6UKY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkKZIDUCCtV3K5Ie9m0ZeQBryXRiyvS/JLhCV0b300Xe3ZrVfe
	X3HOldjl8dk+npdoc+warvELSmlQ2zbTXzSQpJ4VIVbQHahftLTqUvlHmjetfm9DWg+O+32yGSI
	ECY7RQJmf2FigGz8cQ7tqZdw5poLGDmw=
X-Received: by 2002:a05:6402:234f:b0:68d:4e6:7187 with SMTP id
 4fb4d7f45d1cf-69879dfe077mr1210935a12.23.1782807925655; Tue, 30 Jun 2026
 01:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626105150.362203-1-dongtai.guo@linux.dev>
In-Reply-To: <20260626105150.362203-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 30 Jun 2026 16:25:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H44SLq=5ZYP8+63Pwcz9cJZsS5idOek7EdAMf23+Nb8SQ@mail.gmail.com>
X-Gm-Features: AVVi8CcYEPxxLKEfGxSniebHblaYRpYd723gGgrRBElmGtQv2txfLzy2jfu1FEE
Message-ID: <CAAhV-H44SLq=5ZYP8+63Pwcz9cJZsS5idOek7EdAMf23+Nb8SQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: kexec: Fix address space mismatch in command
 line lookup
To: George Guo <dongtai.guo@linux.dev>
Cc: WANG Xuerui <kernel@xen0n.name>, Qiang Ma <maqianga@uniontech.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>, 
	kernel test robot <lkp@intel.com>, Kexin Liu <liukexin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Fri, Jun 26, 2026 at 6:52=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> When searching the loaded segments for the "kexec" command line marker,
> the kexec_load(2) path (file_mode =3D=3D 0) passes the user-space segment
> buffer straight to strncmp() through a bogus (char __user *) cast. This
> dereferences a user pointer in kernel context, which is wrong and is
> flagged by sparse:
>
>   arch/loongarch/kernel/machine_kexec.c:84:51: sparse: incorrect type in
>   argument 2 (different address spaces) @@ expected char const * @@ got
>   char [noderef] __user *
>
> Copy the marker-sized prefix of each segment into a small on-stack
> buffer with copy_from_user() before comparing, and skip segments that
> fault. The subsequent copy_from_user() that stages the full command line
> into the safe area is left unchanged.
>
> Fixes: 4a03b2ac06a5 ("LoongArch: Add kexec support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605051639.aEPioXdD-lkp@i=
ntel.com/
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/kernel/machine_kexec.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kerne=
l/machine_kexec.c
> index d7fafda1d541..6f563175ddbf 100644
> --- a/arch/loongarch/kernel/machine_kexec.c
> +++ b/arch/loongarch/kernel/machine_kexec.c
> @@ -42,7 +42,7 @@ static unsigned long first_ind_entry;
>  int machine_kexec_prepare(struct kimage *kimage)
>  {
>         int i;
> -       char *bootloader =3D "kexec";
> +       static const char bootloader[] =3D "kexec";
>         void *cmdline_ptr =3D (void *)KEXEC_CMDLINE_ADDR;
>
>         kimage->arch.efi_boot =3D fw_arg0;
> @@ -57,9 +57,13 @@ int machine_kexec_prepare(struct kimage *kimage)
>                                         strlen((char *)kimage->arch.cmdli=
ne_ptr) + 1);
>                 kimage->arch.cmdline_ptr =3D (unsigned long)KEXEC_CMDLINE=
_ADDR;
>         } else {
> +               char tmp[sizeof(bootloader)];
Just define it as "head[8]" near bootloader, and bootloader is
unnecessary to modify.

Huacai

> +
>                 /* Find the command line */
>                 for (i =3D 0; i < kimage->nr_segments; i++) {
> -                       if (!strncmp(bootloader, (char __user *)kimage->s=
egment[i].buf, strlen(bootloader))) {
> +                       if (copy_from_user(tmp, kimage->segment[i].buf, s=
trlen(bootloader)))
> +                               continue;
> +                       if (!strncmp(bootloader, tmp, strlen(bootloader))=
) {
>                                 if (!copy_from_user(cmdline_ptr, kimage->=
segment[i].buf, COMMAND_LINE_SIZE))
>                                         kimage->arch.cmdline_ptr =3D (uns=
igned long)cmdline_ptr;
>                                 break;
> --
> 2.25.1
>
>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F27C
	for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 07:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F87C433D7
	for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663401578;
	bh=/Aovh0Sqajn80II7zoVXfdYqQJdl+W8eTy4HPh4rtFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qRvIC14OsKc5o3iJeFKTtZnZ09cVcenqfkObKpVq7TciD8wX4MAf0zaJOPTChK0kS
	 dqAxxFQjmgCUp3igQSpwSkkfsHwdJqfk9zoz6VgEkeZlRFI2Z8iridFZjeeeWMSZKv
	 K8uAmllI5zjJBHYs3cXfU4BooQ/xEMq1sm/REropn7HEuzYDCavrbXWqZPe9VCtXtL
	 4tEAXp9LQqkX0tN7HXlNllcvjDoTd9L0tiw7vauO24Rx26AJw7q2Di06KmvABnlvp8
	 unv5Ma40eKVrVi7mJ2sn2Bwium27pWBWKPJzEya3IK9tuJEUFmCJdUg3Jt15SopGr8
	 lX9JRpORPXixw==
Received: by mail-vs1-f53.google.com with SMTP id q26so19464296vsr.7
        for <loongarch@lists.linux.dev>; Sat, 17 Sep 2022 00:59:38 -0700 (PDT)
X-Gm-Message-State: ACrzQf1w500LpQOi5DSetOhXro4tQexILUOBazQEHfN291CWH9r/XVTt
	aVtcD6cGMuFFwosWIEaRJtNp5Kp2ZOoudzXqTjw=
X-Google-Smtp-Source: AMsMyM4DldcHyeNgMxcqL7EywIWD5H7U2AsA2HPKA7+q+r61Zsvb+Mw0AT5M76vdSZikHyI9m2ya5rSIJvKr3TlEIGw=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr3325990vsv.70.1663401577594; Sat, 17 Sep
 2022 00:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXHk2o2g2t34-iMawUjfJd1uCZc1QaXH90TpS54Sg6PiCQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHk2o2g2t34-iMawUjfJd1uCZc1QaXH90TpS54Sg6PiCQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 17 Sep 2022 15:59:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5t0WRYqNi-jCBM0sikn9RUc88s8zLd8sKGmRvYxNFnnA@mail.gmail.com>
Message-ID: <CAAhV-H5t0WRYqNi-jCBM0sikn9RUc88s8zLd8sKGmRvYxNFnnA@mail.gmail.com>
Subject: Re: Removing DT dependency from LoongArch EFI stub
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, linux-efi <linux-efi@vger.kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Ard,

On Sat, Sep 17, 2022 at 2:37 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Hello,
>
> One of the things I didn't quite like was that LoongArch now uses
> libfdt only because our EFI stub code depends on it. I would like to
> fix this.
>
> I have pushed a branch here that implements this. Unfortunately, it
> doesn't proceed beyond
>
> and I need some help debugging the error.
>
> EFI stub: Booting Linux Kernel...
> EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
> EFI stub: Exiting boot services ...
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=efi-cleanups-for-v6.1
>
> The idea is to pass the EFI system table pointer and the command line
> pointer directly. In previous patches, the initrd and memmap code is
> updated so it exposes the information via configuration tables that
> the generic code can parse.
>
> Any help is greatly appreciated.
I'm sorry but I suggest keeping the current light FDT approach. Of
course the upstream LoongArch kernel uses UEFI+ACPI, but it only
supports high-end systems (Loongson-3A/3C CPU with LS7A chipset). In
fact, low-end systems (Loongson-2K CPU in SoC) support is already on
the way and target for 6.2, which uses FDT in order to share a number
of existing drivers. Using the current approach can share lots of boot
code for both high-end and low-end systems, and doesn't break boot
again.

Thanks,
Huacai

>
> Thanks,
> Ard.

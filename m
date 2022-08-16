Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB81FBC
	for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 07:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE0DC43142
	for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660633388;
	bh=MaTqfiKGhuM90U0bJFm9ace+I2vhx3zUu2ZSBpelyRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EcV7psBu0ie5PyXZi9Rs4los5BMoyM+Ze37mCdiu5A2WhZF0Hp31+ABXQSNGR+a3u
	 rPSqx9Dqtg6m66EXsCbFNL8qZqknpMUWi7VvZ/zj3QYKoVikRmEY1PVMx1/mVwc1CS
	 HLGD3mCUyWSd3+RDCbUCki1XWhhTdWbdTUMZR7JXSTRcpWMaKzgjo9OlOdLV8O1k0Q
	 ehcEEIPYGy+M/0n4v9WLbGOflDvWhXtnTK9JHO4fiJsrvVLnKjsd1fmmJu82lqzSlS
	 gJcBrvrUJhkXO+BLDoOX8GvXFnNAkdActZAjOEL7KMpF9HbFOm6YZSDGmhFJlLAd7C
	 Pjfj0y/C+tHDA==
Received: by mail-ua1-f42.google.com with SMTP id e3so303350uax.4
        for <loongarch@lists.linux.dev>; Tue, 16 Aug 2022 00:03:08 -0700 (PDT)
X-Gm-Message-State: ACgBeo1xi+RtRDTfOSV3oJJUYU4ZqscrWAN5b6XUZl1Y7hPotZ3ivT8u
	wij1zuYPs59CGKPp4+J4vTMfmWusPX8UQq6j6gA=
X-Google-Smtp-Source: AA6agR5lgiRrb/fzLFbLaC40uWcyE/qJuMFo1k3z7N4tC+W4VUFCosvxmF2eAfXsO7aXdTniLRiB68KqxdZ1twDsJxU=
X-Received: by 2002:ab0:6944:0:b0:391:10d8:83ac with SMTP id
 c4-20020ab06944000000b0039110d883acmr856271uas.23.1660633386932; Tue, 16 Aug
 2022 00:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220617145754.582056-1-chenhuacai@loongson.cn>
 <CAAhV-H7N7-XH79=N5tTtphZ_EHygPSANjHcBTZ37zWSd2sy7AA@mail.gmail.com>
 <CAMj1kXE4DDAEn1GYk7Q8XKdsNOXJ2ah=FJKE1HRjC0J_VFy60A@mail.gmail.com>
 <CAAhV-H4Bu0cJ7NAaev56EuvoP5jA-TaSGuAPZ=oG-z4EvXLqFg@mail.gmail.com> <b5d9df4d2f127aea7ac7358e413e09358180bd41.camel@xry111.site>
In-Reply-To: <b5d9df4d2f127aea7ac7358e413e09358180bd41.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 16 Aug 2022 15:02:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5j4zfozJS+3JifehWKZbdpts0RB+3FMR4YCixxWATCLg@mail.gmail.com>
Message-ID: <CAAhV-H5j4zfozJS+3JifehWKZbdpts0RB+3FMR4YCixxWATCLg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add efistub booting support
To: Xi Ruoyao <xry111@xry111.site>
Cc: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Tue, Aug 16, 2022 at 2:42 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> Tested-by: Xi Ruoyao <xry111@xry111.site>
>
> But I'm wandering is it possible to load the kernel onto XKVRANGE
> instead of XKPRANGE?
That needs a lot of work, and may be done in future, thanks.

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University

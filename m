Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5807C
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 07:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BCDC433C1
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 07:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661584451;
	bh=bQaVKBfsaLgFQiFbtFaJvcqVdo/u/g4Ip0tVdWmYieQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MuvtgXa0YJPctLv2mT8DfNi0I5KdPrtZD8YgtzWdktEzyf/YogOa/LKGqu5nVWK+H
	 Z/Jy1DsA5qi5+ZmGLhJTw6q30Ixe9S4To6brhk8PzAfRbitjd7TULsBwhQrwEU+S4h
	 KxTieZLSV2ngyyRacvTGeGvMRvGYw4ccE17vx4jHnsYBEyv0AA26+Egw8EjTGWz6zz
	 CdUTbOKzSpAfbv61qT2Cw2DFQvVD2BYJcfIDHAFaHnppPgtv9Qsp48xZUnifVtj70O
	 VZzHlRQZpQsXV/vyoNG1zSmyCYj6BoKL7bKeQbWWnpybGFjp6Biny5JZA/EOkd2Qqf
	 sqjS9WTInxJAg==
Received: by mail-wm1-f42.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so1870101wms.0
        for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 00:14:11 -0700 (PDT)
X-Gm-Message-State: ACgBeo230z3THA3iPKX57dnEv1yCoqbbkFOGLK2vMKa+uOGvp2bn3QGR
	z96lH7o2M9q+Z8/kjH8hTH/khkTatcnow0ByqZo=
X-Google-Smtp-Source: AA6agR7p8GijcUOtJGznPBKhpfg9HyxCqjidJlhRFBvsrg/twaTrPlEhxNPEg5Uu1s2eYVOnl4WfetJWsHoWy5eWk/c=
X-Received: by 2002:a1c:3b55:0:b0:3a6:7b62:3901 with SMTP id
 i82-20020a1c3b55000000b003a67b623901mr1520421wma.113.1661584449515; Sat, 27
 Aug 2022 00:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn> <9b6f0aeaebbd36882b5b40d655f9ccd20c7be496.camel@xry111.site>
In-Reply-To: <9b6f0aeaebbd36882b5b40d655f9ccd20c7be496.camel@xry111.site>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 27 Aug 2022 09:13:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFOd+gMHbi6MH0KHWkBEKN9V0LeZbyGRw8h630OxtMrdA@mail.gmail.com>
Message-ID: <CAMj1kXFOd+gMHbi6MH0KHWkBEKN9V0LeZbyGRw8h630OxtMrdA@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Aug 2022 at 06:41, Xi Ruoyao <xry111@xry111.site> wrote:
>
> Tested V3 with the magic number check manually removed in my GRUB build.
> The system boots successfully.  I've not tested Arnd's zBoot patch yet.

I am Ard not Arnd :-)

Please use this branch when testing the EFI decompressor:
https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-decompressor-v4

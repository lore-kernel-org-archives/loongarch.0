Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D33229
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E160C433D6
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663848484;
	bh=mZtO78L7kUm4pLq8Iw70ss7GQPlynjH+x+7zIy2VvRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CCeLqhxXzkcEfRm6dn755WHy36BeFAtNiTBIH+gVSlNSl3nJLaFM+xCJNtGwBNuhd
	 hzuABqlnlpqYaP2FYZP3uDuS47dqr0TP7w1TiQoV5CyZAdFP+/5b1gqANvgwdvtMGY
	 rb+JQS1xpPm5UX2+sBKNnKcwVkXATVrWQjDFGCwpq3WQJvgrACheHwwhAoMJJIxWuB
	 auZ6vD/FMGoPGzlaMYFr5DpK1dbyI1iccGRTgxvnlMULDQWct75zWPI/bda1ptZr2X
	 K9AQ5b7CyPxUGfvUhko90r9uv9OIgOWAcwFeP04zSa2kVrbwO+W4Ml9cevarCmfsLF
	 1cndDw7BzTyeg==
Received: by mail-vs1-f48.google.com with SMTP id j7so9982386vsr.13
        for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 05:08:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf3mCSx1ym5+JM4I9rKvz33Zp62bpWtowJl+TJSu5KT+DZLIJsL6
	9CrTy2J5UtmN8ZCPc5ThTJfyn2SI2oC1xOU7llk=
X-Google-Smtp-Source: AMsMyM6QIJF9P7etA/3bfW9xEi9a0pGf9L8/Yu4xO2EsSB2/QvgD68OrwjcUMrgGDe+rhTpuuTqNmNEyEAjKnOOvGoU=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr936440vsv.70.1663848483545; Thu, 22 Sep
 2022 05:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220920183554.3870247-1-ardb@kernel.org> <20220920183554.3870247-9-ardb@kernel.org>
 <CAAhV-H4+Exqu6Z3G_hYmhz=Ccv_4EKLjQ5GVT8h3YsJy0FSpAg@mail.gmail.com>
 <CAMj1kXG9HRn6iV5x-Q94xdOhNhiKMGiO6SkE3LMwzXPkXxen_Q@mail.gmail.com>
 <CAAhV-H5AjwKd-ydZTA=vKCA+fe_gAVyhCM2s-Wm54AqWqpBF1A@mail.gmail.com>
 <CAMj1kXFKfwvvidNPumQNzhHXSR4kHpTq-j4ygR=Jow7yySc44Q@mail.gmail.com>
 <CAAhV-H6O+a57aZbYH0yiCgNp18=shFvGtAppXFNSWGPRs0Ng2g@mail.gmail.com>
 <CAMj1kXF=ON-7GyHVvW8bMX1-5zreDUr7D_zNUs5PQdRW+uM+JQ@mail.gmail.com>
 <CAAhV-H5LLFyQbzzZLUyY38kYU5LvOacXPfrL6zzbZFDvE7QBhw@mail.gmail.com> <CAMj1kXGYFD+_VZ51M4mu1OAjbkPQsPyE-iKviiUbb8ibLrNczQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGYFD+_VZ51M4mu1OAjbkPQsPyE-iKviiUbb8ibLrNczQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 22 Sep 2022 20:07:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cp_ip9B4BD65CsCerjKtfaxcQqi1T3QB8VveRXLhY_w@mail.gmail.com>
Message-ID: <CAAhV-H7cp_ip9B4BD65CsCerjKtfaxcQqi1T3QB8VveRXLhY_w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] efi/loongarch: libstub: remove dependency on
 flattened DT
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi <linux-efi@vger.kernel.org>, loongarch@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

Hi, Ard,

On Thu, Sep 22, 2022 at 4:59 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 22 Sept 2022 at 09:42, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > On Thu, Sep 22, 2022 at 3:25 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Thu, 22 Sept 2022 at 09:22, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > >
> > > > On Thu, Sep 22, 2022 at 3:13 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > On Thu, 22 Sept 2022 at 04:15, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, Sep 21, 2022 at 4:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > >
> > > > > > > On Wed, 21 Sept 2022 at 06:02, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > > >
> > > > > > > > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > >
> > > > > > >
> > > > > > > Thank you Huacai
> > > > > > >
> > > > > > > I have created a separate tag with these patches applied onto the
> > > > > > > first loongarch efi enablement patch (see below)
> > > > > > >
> > > > > > > I would prefer to keep the loongarch trees separate for the next merge
> > > > > > > window, but if needed to avoid massive conflicts, you could merge the
> > > > > > > tag into the loongarch tree and rebase your changes on top. But please
> > > > > > > take care not to rebase those patches themselves: the commit SHAs need
> > > > > > > to remain the same.
> > > > > > >
> > > > > > > However, if the conflicts are only minor, you can just explain in your
> > > > > > > PR to Linus what the resolution should look like.
> > > > > > >
> > > > > > > The tag can be found here:
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=efi-loongarch-for-v6.1-2
> > > > > > >
> > > > > > > I have merged this into the EFI tree as well and pushed it out; it
> > > > > > > should appear in -next tomorrow.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > b093dc55ba9a efi/loongarch: libstub: remove dependency on flattened DT
> > > > > > > 102faf0747c2 efi: libstub: install boot-time memory map as config table
> > > > > > > 7318926e7bc9 efi: libstub: remove DT dependency from generic stub
> > > > > > > 7cb6671e3caa efi: libstub: unify initrd loading between architectures
> > > > >
> > > > > I will have to respin the initrd patch, unfortunately, as it breaks
> > > > > x86. So the signed tag will be updated, and the SHAs above will change
> > > > > as well.
> > > > Emm, initrd is also broken on LoongArch, the core kernel gets an
> > > > EFI_INVALID_TABLE_ADDR address.
> > > >
> > >
> > > OK, I will investigate. This was working fine before so I'm not sure
> > > what happened there.
> > >
>
> I cannot reproduce this. Can you reproduce it with qemu? If so, can
> you share your command line and .config etc?
In qemu we also OK, but on a real machine efistub fails at
efi_bs_call(locate_device_path, &lf2_proto_guid, &dp, &handle), maybe
our UEFI BIOS has some problems? On a real machine we use grub and
there is no "initrd" command in UEFI shell.

Huacai

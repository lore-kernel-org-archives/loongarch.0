Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B61854
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60243C4347C
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663851049;
	bh=S+G08lsWHXAG5jn0lLM82y9jaOsCJlQP465jkfycXO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ma3+7ZLMo71FhTZe2+KOubnrC4G2erugpTb6udezkIMXgeXAk8LdRrUxzS1eGxSJu
	 hq+vR04K7qoeChoEHMZRjjot3Omuk8NPTVO8QxN7EtOtC2e9p9rijkGL59W3MvfE9f
	 R1JGUwzIjh+1JTZUhB4hivh0WH63YakjzVaxB5W6IdaH+W9pSmmR9nWRAc04KQZW2I
	 FynnQ9k1G/p20ZexKYB201nZJjTCjt9MNDHt4Sb34Dcj/413PRMO76CzmlOrvhTIt2
	 lb45q297aAx9e4DJwjOIu4jG9HK/ns14CJjRqHzf8rNPguoohZnNcrXQiIXlCluiQ7
	 AQXsgNyXxMGjA==
Received: by mail-lj1-f174.google.com with SMTP id g20so9641579ljg.7
        for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 05:50:49 -0700 (PDT)
X-Gm-Message-State: ACrzQf1nSh75mZtbQAZLDL8/9FAkqaYYrvshRFd4nKv00nJAFIVS2n94
	njAVhXGYmQ6KEmQQa+2pKeQnROLoTqGhFDzf7pI=
X-Google-Smtp-Source: AMsMyM5m37p0AtsIhnPJOXVNAKbHtzwF7XbUz+nJhvCMvUl7Y1eCYLfo8TGSZyTppEJiHkMInEHNRNVvbUPCDMszNxY=
X-Received: by 2002:a2e:7314:0:b0:26a:ca18:60eb with SMTP id
 o20-20020a2e7314000000b0026aca1860ebmr960168ljc.69.1663851047384; Thu, 22 Sep
 2022 05:50:47 -0700 (PDT)
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
 <CAAhV-H5LLFyQbzzZLUyY38kYU5LvOacXPfrL6zzbZFDvE7QBhw@mail.gmail.com>
 <CAMj1kXGYFD+_VZ51M4mu1OAjbkPQsPyE-iKviiUbb8ibLrNczQ@mail.gmail.com> <CAAhV-H7cp_ip9B4BD65CsCerjKtfaxcQqi1T3QB8VveRXLhY_w@mail.gmail.com>
In-Reply-To: <CAAhV-H7cp_ip9B4BD65CsCerjKtfaxcQqi1T3QB8VveRXLhY_w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 22 Sep 2022 14:50:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG0nnB4qOyKp8-=ggxFYC_1ut6oHdkqX_mVqdZMadjb8g@mail.gmail.com>
Message-ID: <CAMj1kXG0nnB4qOyKp8-=ggxFYC_1ut6oHdkqX_mVqdZMadjb8g@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] efi/loongarch: libstub: remove dependency on
 flattened DT
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-efi <linux-efi@vger.kernel.org>, loongarch@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Sept 2022 at 14:08, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Ard,
>
> On Thu, Sep 22, 2022 at 4:59 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 22 Sept 2022 at 09:42, Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 3:25 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Thu, 22 Sept 2022 at 09:22, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > >
> > > > > On Thu, Sep 22, 2022 at 3:13 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, 22 Sept 2022 at 04:15, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > >
> > > > > > > On Wed, Sep 21, 2022 at 4:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, 21 Sept 2022 at 06:02, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > >
> > > > > > > >
> > > > > > > > Thank you Huacai
> > > > > > > >
> > > > > > > > I have created a separate tag with these patches applied onto the
> > > > > > > > first loongarch efi enablement patch (see below)
> > > > > > > >
> > > > > > > > I would prefer to keep the loongarch trees separate for the next merge
> > > > > > > > window, but if needed to avoid massive conflicts, you could merge the
> > > > > > > > tag into the loongarch tree and rebase your changes on top. But please
> > > > > > > > take care not to rebase those patches themselves: the commit SHAs need
> > > > > > > > to remain the same.
> > > > > > > >
> > > > > > > > However, if the conflicts are only minor, you can just explain in your
> > > > > > > > PR to Linus what the resolution should look like.
> > > > > > > >
> > > > > > > > The tag can be found here:
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=efi-loongarch-for-v6.1-2
> > > > > > > >
> > > > > > > > I have merged this into the EFI tree as well and pushed it out; it
> > > > > > > > should appear in -next tomorrow.
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > b093dc55ba9a efi/loongarch: libstub: remove dependency on flattened DT
> > > > > > > > 102faf0747c2 efi: libstub: install boot-time memory map as config table
> > > > > > > > 7318926e7bc9 efi: libstub: remove DT dependency from generic stub
> > > > > > > > 7cb6671e3caa efi: libstub: unify initrd loading between architectures
> > > > > >
> > > > > > I will have to respin the initrd patch, unfortunately, as it breaks
> > > > > > x86. So the signed tag will be updated, and the SHAs above will change
> > > > > > as well.
> > > > > Emm, initrd is also broken on LoongArch, the core kernel gets an
> > > > > EFI_INVALID_TABLE_ADDR address.
> > > > >
> > > >
> > > > OK, I will investigate. This was working fine before so I'm not sure
> > > > what happened there.
> > > >
> >
> > I cannot reproduce this. Can you reproduce it with qemu? If so, can
> > you share your command line and .config etc?
> In qemu we also OK, but on a real machine efistub fails at
> efi_bs_call(locate_device_path, &lf2_proto_guid, &dp, &handle), maybe
> our UEFI BIOS has some problems? On a real machine we use grub and
> there is no "initrd" command in UEFI shell.
>

Ah ok, so i guess your GRUB lacks the LoadFile2 patches?

https://lists.gnu.org/archive/html/grub-devel/2022-09/msg00057.html

Those have been blocked in review for almost 2 years. I cc'ed you on
the latest version. Without those patches, GRUB will generate a DT to
pass the initrd information.

I understand this is annoying right now, but I strongly suggest to
implement only a single method of loading the INITRD for EFI boot - it
is much easier to reason about when things like secure boot and
measured boot become relevant on your architecture.

In any case, you can build your UEFI shell with the following dynamic
command from EDK2:

OvmfPkg/LinuxInitrdDynamicShellCommand/LinuxInitrdDynamicShellCommand.inf

This add a 'initrd' command to the UEFI shell

(it will also work for bare metal platforms not only for virtual machines)


If this is a deal breaker for you, one workaround we might consider is
to parse /chosen/linux,initrd-* in the LoongArch stub (but nothing
else) if locating the LoadFile2 protocol fails and a DTB exists in the
config table array. I'd prefer to avoid that if we can, but at least
the initrd is always visible to the stub, for measurement etc.

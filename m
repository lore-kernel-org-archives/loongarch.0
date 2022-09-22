Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3E2580
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 08:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3CDC43149
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663837187;
	bh=cTKpxLn33VhuW71GgnhPHCS9McDwUYGMSRoOmc+DgF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m22zaYAkdhKWl1Ro74IK5d++DJVlhXsBKm5bA8M3RMbWONuvo4r5sqwfNMBwt9N9+
	 8rptN66cmMCAM5IvzctNmYHKX0JkyyirvczTyvo3YUo4G0l55pQmYG+QPFfDko1Swp
	 hsZw9ytb1+yturFFkMKRG7wRJDfG+O5EIUFHBYcHve8fkUBP+QKb94hqY2SVXIPvHu
	 jhoodK7yVFwyHvJbI5DbufD8rw7TUkJ26qgxS11jVFtRamSH4QjATVtKdWV7AZ8YBl
	 2QuEt8RiHcrhs/SwRY5Mt2zlzVzOh4z2W+9S1zXOId6HyM9vrTvXMEG3OpQOXg+I82
	 ezI8xaNMODlVQ==
Received: by mail-lf1-f42.google.com with SMTP id u18so13527636lfo.8
        for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 01:59:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf2UijvYP8JpPlJfoYh/TDqqGVQP1+qQu3smnOZlpKv/0f8MQoV0
	MtJ1IWsDTprqlISmlbjxikIrBGu+FoNmGZA4WRM=
X-Google-Smtp-Source: AMsMyM6CBTbv+7XvdIlW/OFjBl57r6K2tZmW5I9f8O82uiQn+RvDvTY7LCL/TcJG2OrsQj7fN6lDqz+Pg2+pBlAeRLo=
X-Received: by 2002:a05:6512:4024:b0:497:4db:6ad0 with SMTP id
 br36-20020a056512402400b0049704db6ad0mr881759lfb.637.1663837185028; Thu, 22
 Sep 2022 01:59:45 -0700 (PDT)
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
 <CAMj1kXF=ON-7GyHVvW8bMX1-5zreDUr7D_zNUs5PQdRW+uM+JQ@mail.gmail.com> <CAAhV-H5LLFyQbzzZLUyY38kYU5LvOacXPfrL6zzbZFDvE7QBhw@mail.gmail.com>
In-Reply-To: <CAAhV-H5LLFyQbzzZLUyY38kYU5LvOacXPfrL6zzbZFDvE7QBhw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 22 Sep 2022 10:59:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGYFD+_VZ51M4mu1OAjbkPQsPyE-iKviiUbb8ibLrNczQ@mail.gmail.com>
Message-ID: <CAMj1kXGYFD+_VZ51M4mu1OAjbkPQsPyE-iKviiUbb8ibLrNczQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] efi/loongarch: libstub: remove dependency on
 flattened DT
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-efi <linux-efi@vger.kernel.org>, loongarch@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Sept 2022 at 09:42, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Thu, Sep 22, 2022 at 3:25 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 22 Sept 2022 at 09:22, Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 3:13 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Thu, 22 Sept 2022 at 04:15, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > >
> > > > > On Wed, Sep 21, 2022 at 4:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, 21 Sept 2022 at 06:02, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > >
> > > > > > > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > >
> > > > > >
> > > > > > Thank you Huacai
> > > > > >
> > > > > > I have created a separate tag with these patches applied onto the
> > > > > > first loongarch efi enablement patch (see below)
> > > > > >
> > > > > > I would prefer to keep the loongarch trees separate for the next merge
> > > > > > window, but if needed to avoid massive conflicts, you could merge the
> > > > > > tag into the loongarch tree and rebase your changes on top. But please
> > > > > > take care not to rebase those patches themselves: the commit SHAs need
> > > > > > to remain the same.
> > > > > >
> > > > > > However, if the conflicts are only minor, you can just explain in your
> > > > > > PR to Linus what the resolution should look like.
> > > > > >
> > > > > > The tag can be found here:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=efi-loongarch-for-v6.1-2
> > > > > >
> > > > > > I have merged this into the EFI tree as well and pushed it out; it
> > > > > > should appear in -next tomorrow.
> > > > > >
> > > > > >
> > > > > >
> > > > > > b093dc55ba9a efi/loongarch: libstub: remove dependency on flattened DT
> > > > > > 102faf0747c2 efi: libstub: install boot-time memory map as config table
> > > > > > 7318926e7bc9 efi: libstub: remove DT dependency from generic stub
> > > > > > 7cb6671e3caa efi: libstub: unify initrd loading between architectures
> > > >
> > > > I will have to respin the initrd patch, unfortunately, as it breaks
> > > > x86. So the signed tag will be updated, and the SHAs above will change
> > > > as well.
> > > Emm, initrd is also broken on LoongArch, the core kernel gets an
> > > EFI_INVALID_TABLE_ADDR address.
> > >
> >
> > OK, I will investigate. This was working fine before so I'm not sure
> > what happened there.
> >

I cannot reproduce this. Can you reproduce it with qemu? If so, can
you share your command line and .config etc?

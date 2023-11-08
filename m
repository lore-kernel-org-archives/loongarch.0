Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF3AFC13
	for <loongarch@lists.linux.dev>; Wed,  8 Nov 2023 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [209.85.219.179])
	by gateway (Coremail) with SMTP id _____8CxRuizVktlyP83AA--.56520S3;
	Wed, 08 Nov 2023 17:36:52 +0800 (CST)
Received: from mail-yb1-f179.google.com (unknown [209.85.219.179])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxL92xVktlRPA7AA--.2307S3;
	Wed, 08 Nov 2023 17:36:50 +0800 (CST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so6094460276.1
        for <loongarch@lists.linux.dev>; Wed, 08 Nov 2023 01:36:50 -0800 (PST)
X-Gm-Message-State: AOJu0YxzWj11oC1VOjkmYPy+Z5iDgUjJYifra+OhJ1ksH4HVTfwPyWjp
	fFnsyIboZ566UyEHod0kFIwZq4JatiaHBDaoUG8cxQ==
X-Google-Smtp-Source: AGHT+IF7Egb8RiUObh7jAE8iM4wFRrqgo9bG5b8f2JcO57JxfoqZyKyA977e/ECC4xVaAtAw/8f7y7/RheUTwoNIqyA=
X-Received: by 2002:a05:6902:1008:b0:da0:5933:c62d with SMTP id
 w8-20020a056902100800b00da05933c62dmr1369671ybt.28.1699436208883; Wed, 08 Nov
 2023 01:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108040447.288870-1-wangrui@loongson.cn> <d32d8a26dcd75a840727cdb50546b621d34d326b.camel@xry111.site>
 <CAHirt9jQHTRGdv4rShgvWHEbG1vzuLkNDbxLP7x4eMtuB3BB5g@mail.gmail.com> <4075b4dad9bedbc3def5dfe75f66f3e5d49ce6d5.camel@xry111.site>
In-Reply-To: <4075b4dad9bedbc3def5dfe75f66f3e5d49ce6d5.camel@xry111.site>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 8 Nov 2023 17:36:38 +0800
X-Gmail-Original-Message-ID: <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
Message-ID: <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Disable module from accessing external data directly
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8BxL92xVktlRPA7AA--.2307S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ury5CF4xXw4kJF1xGw4xXwc_yoW8Xr4kpa
	97GF1rKws7Xry8ZrnavFn7Z3Wa9a1xCrWxKFy8Cw15Zas0kr9rXa13tr4agFnFqrZ0gw12
	krs2ga47uryUXagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8YiiDUUUUU==

On Wed, Nov 8, 2023 at 5:26=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Wed, 2023-11-08 at 17:20 +0800, WANG Rui wrote:
> > > then the linked binary triggers a SIGBUS.  Ideally this should be
> > > detected by the linker at link time, but currently the BFD linker
> > > fails
> > > to detect this error (FWIW this flaw is caused by a really nasty
> > > method
> > > for the medium code model implementation).  So to me -fno-direct-
> > > access-
> > > external-data is the default.  I also grepped for -fdirect-access-
> > > external-data in the kernel building system but I've not found any
> > > match.
> > >
> > > Are you using a different version of Clang, or maybe Clang has some
> > > configuration-time option to make -fdirect-access-external-data the
> > > default?
> >
> > The clang enables `direct-access-external-data` by default in PIC and
> > disables it by default in no-PIC. This also applies to PIE. [1]
>
> Oh sh*t:
>
> xry111@nanmen2 ~ $ clang t1.c -O2 -fno-pie -no-pie
> xry111@nanmen2 ~ $ ./a.out
> Bus error (core dumped)
>
> I'll consider it a Clang bug then.

That's it, no copy relocations. As far as I know, copying relocations
has some issues and is not recommended by Fangrui.

For modules, if distance is not a problem, `no-pic` and
`direct-access-external-data` can be together because the code is
writable. Does it seem reasonable to exist?

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>


--=20
WANG Rui


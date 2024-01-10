Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB27D50F
	for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.166.179])
	by gateway (Coremail) with SMTP id _____8AxTbvBB55l1bUDAA--.3108S3;
	Wed, 10 Jan 2024 10:58:10 +0800 (CST)
Received: from mail-il1-f179.google.com (unknown [209.85.166.179])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax692+B55liBIKAA--.27013S3;
	Wed, 10 Jan 2024 10:58:08 +0800 (CST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3606ef221dbso20138635ab.2
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 18:58:08 -0800 (PST)
X-Gm-Message-State: AOJu0Yx5lMIInakMQ7CU9gbvk3FgwlNyyn05Pumib4U/chpSL+AMn/yK
	gdaH+dvG8pxG/l2oEZQIXzPOFJ/Pt3VohHimBhH6FakIb1q0oA==
X-Google-Smtp-Source: AGHT+IGFu70ifP6sZpWVKvAz9jkvhFQs0aK9sfB9mzmNZLo6qnO/qlrCw7c+TfeqTmvh2JMP1DwvoCXJuMWwzU2xTgI=
X-Received: by 2002:a05:6902:351:b0:dbd:5b5e:820b with SMTP id
 e17-20020a056902035100b00dbd5b5e820bmr195849ybs.98.1704853772254; Tue, 09 Jan
 2024 18:29:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
 <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com> <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home>
In-Reply-To: <ZZ38XMQw18mw2sTA@Boquns-Mac-mini.home>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 10 Jan 2024 10:29:21 +0800
X-Gmail-Original-Message-ID: <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
Message-ID: <CAHirt9jQSVvBF=1wc=sT9FxngeSP30P4FDpu8m0JH_0fOPSO-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Ax692+B55liBIKAA--.27013S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFW3tF4xtr43Jw1xZw1kWFX_yoW8urW3p3
	y7ZFn0kr4kGr13Jrna9w15WF1Yyw1fKr97X3WDJryxKr90yr1qyrWxtrW3Wa4DZry8CFW0
	vr1Uu3ZxJF1UAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUt529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Mq2tUUUUU==
X-Gw-Check: 1b789bf9a546a4ae

On Wed, Jan 10, 2024 at 10:09=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Wed, Jan 10, 2024 at 09:41:38AM +0800, WANG Rui wrote:
> > Hi Boqun,
> >
> > On Wed, Jan 10, 2024 at 3:35=E2=80=AFAM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > Hi,
> > >
> > > Thanks for the patch.
> > >
> > > On Mon, Jan 08, 2024 at 11:21:15AM +0800, WANG Rui wrote:
> > > > Enable Rust support for the LoongArch architecture.
> > > >
> > >
> > > Could you share how you build and test? For example, I wonder the cla=
ng
> > > or gcc version you used and bindgen version you used. Thanks.
> >
> > You are welcome! The versions I'm using are listed in
> > scripts/min-tool-version.sh, and I have tested Rust samples and the
> > rnull block driver.
> >
> > llvm: main branch (ea3c7b3397f8de8e885ea7cd1ed5138ec4a72d50)
>
> This means the LLVM support is yet to release? Or does LLVM 17 also
> work?

LLVM 17 doesn't work. The minimum LLVM version required for LoongArch
is 18.0.0. This is the reason why we have updated the
scripts/min-tool-version.sh. [1]

[1] https://lore.kernel.org/loongarch/20240108033138.217032-1-wangrui@loong=
son.cn/

Regards,
Rui

>
> Regards,
> Boqun
>
> > rustc: 1.74.1
> > bindgen: 0.65.1
> >
> > Here are the build steps:
> >
> > 1. Build llvm
> > 2. Install rust, rust-src (using rustup) and bindgen
> > 3. Build kernel
> >
> > For more details, refer to Documentation/rust/quick-start.rst; there
> > is nothing special about it.
> >
> > Regards,
> > Rui
> >
> > >
> > > Regards,
> > > Boqun
> > >
> > > > Previous versions:
> > > > v0: https://lore.kernel.org/loongarch/20240106065941.180796-1-wangr=
ui@loongson.cn/
> > > >
> > > > Changes in v1:
> > > >  - Address htmldocs warning.
> > > >
> > > > WANG Rui (2):
> > > >   Documentation: rust: Add a character to the first column
> > > >   LoongArch: Enable initial Rust support
> > > >
> > > >  Documentation/rust/arch-support.rst | 13 +++++++------
> > > >  arch/loongarch/Kconfig              |  1 +
> > > >  arch/loongarch/Makefile             |  3 +++
> > > >  scripts/generate_rust_target.rs     | 10 ++++++++++
> > > >  4 files changed, 21 insertions(+), 6 deletions(-)
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> >
>


--=20
WANG Rui


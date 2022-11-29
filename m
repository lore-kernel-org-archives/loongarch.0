Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D214322A
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 13:20:45 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id v206so679478ybv.7
        for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 05:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcmMHtFArVsxc+G/xoaiHhB3Vq1tHgQdTzX99GzoaVE=;
        b=UUtTV6G4KOptFxKfRiHFpCE023EfcGcWCS6IdiaAG8cRsdzW/Gq9wfoKH1Y5NVgnD8
         d6kgKeIJscm8m3YFvonS31hWlcuedgvtA3pCVEEGRsBPMQ/Jnf62NlSxh3tNinzq+ywZ
         xl8eXTEFrpiIBwmwZ8M9SYj8RyhtvObjTQAvApgP4ENzqrBSj5C8oFHhUkAlUcDl3j+X
         veANV8wAIwEr7Og5Dg/OCswcp1kiQuqHL6SQZi0ZsgnH14TIaUTnr0+T/QqF3PLeQn0w
         0l1XKW7/wUPBTLuGOPTAnxzUpXMIxd4+sUZfSq3HXZydsbLrGVZPhVfb0qDntE1pDKVO
         AeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcmMHtFArVsxc+G/xoaiHhB3Vq1tHgQdTzX99GzoaVE=;
        b=frc2Lpo2af//fOd79AEYY75LXqWs6ktQv6Xv09mNBJn3GTg2xkGS3T7IXQAKhlk4Gj
         reT18Hfp33eX5aABeV+IRrOKWMtYRrwTI3ZzXjoRcSDhpqAlzcBAbgJZevyt/dQmo65r
         lU3u8VxzpZHtXYFLdmqyVAmaRUhEiAlrDdeuU8nXgBPzMQum5pg6ndk/bU4uO63SP068
         gwOHJj8yhy14SCQhhZ5l4QHaNxTmxHuGvzRXrxjzPFXLzyhaOFdTeloe2JL6P15yufGl
         hLTBUxobNvSNi8uci74zI1f2KSgCtQFTgpYjxKjOalMlxml0FBSHQfYefCLSmmPsmABG
         7Xtg==
X-Gm-Message-State: ANoB5pmKJl5RHOafhgembyy1u8UzxrXNwEGmUQJqnaUeP3VGI8xNOnsu
	xkW0ioSFzsoMI1DuAfXTtX2wxFyflB1/8K+p534=
X-Google-Smtp-Source: AA0mqf7DnzwsNm7jfKGSgqmF2qCFYYh2m9uHcXPFxeajqKi5arYCAhZ3uBAxi92ol5LRbFnMNlaNP66NfbEs6zrWAE4=
X-Received: by 2002:a25:41d1:0:b0:6f0:8cc2:22ac with SMTP id
 o200-20020a2541d1000000b006f08cc222acmr27560226yba.303.1669728044066; Tue, 29
 Nov 2022 05:20:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1669686320.git.siyanteng@loongson.cn> <653b590c8e7ca42faff18cabfceb9b7f4b2971c1.1669686320.git.siyanteng@loongson.cn>
 <29198961-5100-8e8c-f5a2-87d15769c550@xen0n.name> <6b84b57f-5293-0636-7a91-235aea910b7a@loongson.cn>
In-Reply-To: <6b84b57f-5293-0636-7a91-235aea910b7a@loongson.cn>
From: yanteng si <siyanteng01@gmail.com>
Date: Tue, 29 Nov 2022 21:20:32 +0800
Message-ID: <CAEensMz+PkLeGmxwwf4_EWXp9cgAd1egGZEujBa1q5=YHviieg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] docs/LoongArch: Add booting
To: Yanteng Si <siyanteng@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org, corbet@lwn.net, 
	alexs@kernel.org, seakeel@gmail.com, wu.xiangcheng@linux.dev, 
	jiaxun.yang@flygoat.com, liuyun@loongson.cn, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2022=E5=B9=B411=E6=9C=8829=E6=
=97=A5=E5=91=A8=E4=BA=8C 21:04=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On 11/29/22 10:40, WANG Xuerui wrote:
>
> On 11/29/22 09:52, Yanteng Si wrote:
>
> Describes the meaning and value of the image header field.
>
> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   Documentation/loongarch/booting.rst | 89 +++++++++++++++++++++++++++++
>   Documentation/loongarch/index.rst   |  1 +
>   2 files changed, 90 insertions(+)
>   create mode 100644 Documentation/loongarch/booting.rst
>
> diff --git a/Documentation/loongarch/booting.rst b/Documentation/loongarc=
h/booting.rst
> new file mode 100644
> index 000000000000..90456f713c48
> --- /dev/null
> +++ b/Documentation/loongarch/booting.rst
> @@ -0,0 +1,89 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=90=AF=E5=8A=A8 LoongArch Linux
>
>
> Forgot to translate this? ;-)
>
> Also it's probably more idiomatic to use the "Linux/LoongArch" convention=
 throughout, as can be seen from similar previous usages such as "Linux/Alp=
ha", "Linux/IA64", "Linux/PA-RISC" or "Linux/MIPS". (Of course it's "RISC-V=
 Linux" according to my grep result but it's probably better to stick to tr=
aditions here IMO.)
>
> OK!
>
> Booting Linux/LoongArch
>
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Yanteng Si <siyanteng@loongson.cn>
> +:Date:   18 Nov 2022
> +
> +BootLoader passing parameters to the kernel
>
> "Bootloader" or "Boot loader", but not "BootLoader".
>
> Ok!
>
> Bootloader
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +LoongArch supports ACPI and FDT. The information that needs to be
> +passed to the kernel are memmap, initrd, cmdline, fdt, etc.
>
> Perhaps "... includes the memmap, the initrd, the command line, optionall=
y the FDT, and so on." could be better?
>
> Great!
>
> The information that needs to be passed to the kernel includes the memmap=
, the initrd, the command line, optionally the FDT, and so on.
>
> +On LoongArch machines, the BootLoader (EFISTUB/Grub) will pass three
> +valid parameters to the kernel, which are::
>
>
> The "on LoongArch machines" seems redundant, we're a LoongArch document s=
o it's kinda implied information. Also drop "valid" as it's quite obvious t=
oo.
>
> And it's not the bootloader that provides the kernel with those 3 argumen=
ts, kernel_entry isn't directly called by firmware but rather by the EFI st=
ub. And I doubt the FDT boot flow invokes kernel_entry either. Let's clarif=
y things then, make the whole paragraph something like this:
>
> "The kernel is passed the following arguments on `kernel_entry`::"
>
> OK!
>
>
> +
> +      a0 =3D efi_boot
> +      a1 =3D cmdline
> +      a2 =3D systemtable
> +
> +where a1 is a pointer to cmdline, a2 contains the memmap, initrd,
> +fdt(opt) and other information that needs to be passed to the kernel.
>
>
> Please use a list for enumerating the 3 arguments.
>
> Also the list belongs to the previous sentence, so you shouldn't start th=
is paragraph with "where" but rather please use a new sentence. And the fac=
t that a0 is a flag indicating whether full UEFI capabilities are present n=
eeds mentioning too.
>
> "`efi_boot` is a flag indicating whether this boot environment is fully U=
EFI-compliant. `cmdline` is a pointer to the kernel command line. `systemta=
ble` points to the EFI system table. All pointers involved at this stage ar=
e in physical addresses."
>
> OK, thanks!
>
>
> +
> +Boot image header in LoongArch Linux
>
> "Header of Linux/LoongArch kernel images"
>
> OK!
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following 64-byte header is present in decompressed Linux
> +kernel image::
>
>
> Everything becomes crystal clear when you somehow indicate it's just the =
DOS header of the EFI stub. Also AFAIK no LoongArch bootloader decompress t=
he kernel image themselves, so it's not like there exists any "compressed L=
inux kernel image".
>
> "Linux/LoongArch kernel images are EFI images. Being PE files, they have =
a 64-byte header structured like::"
>
> OK!
>
>
> +
> +    u32    MZ_MAGIC        /* "MZ", MS-DOS header */
> +    u32    res0 =3D 0        /* reserved */
> +    u64    kernel_entry        /* Kernel entry point */
> +    u64    _end - _text        /* Kernel image effective size */
> +    u64    0            /* Kernel image load offset from start of RAM */
> +    u64    res1 =3D 0        /* reserved */
> +    u64    res2 =3D 0        /* reserved */
> +    u64    res3 =3D 0        /* reserved */
> +    u32    res4 =3D 0        /* reserved */
> +    u32    pe_header - _head    /* Offset to the PE header */
> +
> +Header notes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> No need for a new section: the rest are all explanations to the structure=
 mentioned above.
>
> OK!
>
> +
> +Currently, LoongArch has removed the "magic" field.
>
>
> Needs more background information, and (IMO) unnatural topicalization.
>
> "LoongArch has abolished the use of a magic number for identifying the bo=
ot image as one for the LoongArch, because ..."
>
> Right now, unfortunately I don't have enough time for providing all the d=
etails for the justification of removal of magic number, but you can refer =
to previous (long) threads where the earlier versions of the arch EFI boot =
code were reviewed. Pay attention especially to ardb's very detailed and in=
-depth explanation, you want to "transplant" the info here.
>
> OK!
>
>
> +
> +According to the EFI specification, the PE/COFF image file header is
> +required at the beginning of the kernel image; the LoongArch kernel
> +supports the EFI stub, so the first two bytes of the kernel image header
> +are "MZ" magic characters, and 0x3c should point to the rest of the
> +PE/COFF file header, between which The kernel entry point, image
> +effectivesize, and image load offset layout are as follows::
> +
> +          +-----------------------------------------------+
> +          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
> +          +-----------------------------------------------+
> +    0x00: |       MZ_MAGIC        |          res0         |
> +          +-----------------------------------------------+
> +    0x08: |                 kernel_entry                  |
> +          +-----------------------------------------------+
> +    0x10: |                  _end - _text                 |
> +          +-----------------------------------------------+
> +    0x18: |                       0                       |
> +          +-----------------------------------------------+
> +    0x20: |                      res1                     |
> +          +-----------------------------------------------+
> +    0x28: |                      res2                     |
> +          +-----------------------------------------------+
> +    0x30: |                      res3                     |
> +          +-----------------------------------------------+
> +    0x38: |          res4         |       PE header       |
> +          +-----------------------------------------------+
>
>
> This is repeating the structure described above, only in a pictorial form=
. I think only one needs to be kept.
>
> I don't think so.
>
> The above corresponds to the struct in grub, this diagram is much more re=
adable.
>
>
>
> +
> +All bit fields are in little endian:
> +
> +    - MZ: Effective length of 2 bytes;
> +
> +    - kernel entry point: leaving 6 bytes blank in front, starting
> +      from 0x8, with a effective length of 8 bytes;
> +
> +    - kernel image effective size: Immediately following the kernel
> +      entry point, with a effective length of 8 bytes, this field is
> +      required for the bootloader;
>
>
> The boot loader probably doesn't care. GRUB2 just chain-loads after recog=
nizing the image as valid EFI application, and the firmware most certainly =
just do its routine EFI application launch too without looking at the conte=
nts here that are all in fact just reserved space. (IIUC only the MZ signat=
ure and the PE header offset matter here; everything in between is actually=
 part of the DOS stub which is ignored on all modern platforms.)
>
> So, please clarify which component requires this info; is it the EFI stub=
 instead? (I haven't checked myself though due to limited review time. Sorr=
y for that.)
>
> I wrote this article with partial reference to riscv.
>
> See Documentation/riscv/boot-image-header.rst line 61:
>
> - Image size is mandatory for boot loader to load kernel image. Booting w=
ill
>   fail otherwise.
>
>
> +
> +    - kernel image load offset: Immediately following the kernel
> +      image effective size, with a effective length of 8 bytes;
> +
> +    - Offset to the PE header: leaving 28 bytes blank in front,
> +      starting from 0x3c, with a effective length of 4 bytes.
>
> Drop explanation for trivial things like MZ or the PE header offset, they=
're just common PE format thing, and totally unrelated to Linux.
>
> Here's just a simple description of the header bit fields, which is a pre=
requisite for understanding the boot image header.
>
>
> Thanks,
>
> Yanteng
>
> diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/=
index.rst
> index aaba648db907..df0174d6d227 100644
> --- a/Documentation/loongarch/index.rst
> +++ b/Documentation/loongarch/index.rst
> @@ -10,6 +10,7 @@ LoongArch Architecture
>        introduction
>      irq-chip-model
> +   booting
>        features
>
>
>
Sorry.

I don't know why my email client sent the html part, which caused the
email to be rejected by the list, so I re-copied it to the list.

Thanks,
Yanteng

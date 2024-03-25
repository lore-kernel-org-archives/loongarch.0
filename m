Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195C1509A2
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711355095; cv=none; b=WUp1sBW6KIQwhSDt6fUnCRSj7Z32Gn3ycCve27/CIIBqSDrsEkN6t+htIUffrcgv4ihl+VlaCTKZ/7fPQTLLsjffd1l51TmFTLUGO6S1bWdAC1fVZ+mYXNi1bUSv2MLah6ZuWUJG6xVqTCr/I+8HTLagKan9iajaKk6pOk5ldHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711355095; c=relaxed/simple;
	bh=HdSwpyEJcq7QPVhfAp25p0Tw/TeM+r3NiX2oIuYDiE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeqBn4W1tyG1XCx9wf4kYhbzCtcPCobFQOEbkKlEX+y7UuwobA0DEOAjWRyGDsgujwatFWaeH+tc3KPw+d8H2CjAH8HApFPSWnW8F2uit29CJb5VgqT0dQ5INLiWD/hW82UyTowraSKP8wGXtMGesc1pWpw2XroTYkNFIbY3McQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc71031680so3466522276.2
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 01:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711355090; x=1711959890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEfLIiCMu33AlwMloMoi4ICYWpFuuaEkY/DY4cDIgmE=;
        b=maMaBiMtlXkUvXb4o229NtHovb7q6qHJc86mp8cdxriFfuuXjdq98vDIBaDHSafYRl
         ZFCjqOUyKdmtmr8t2lWnbFzPWJN+nN63yaz945cYkdoJjlRu4BSl2Erlbh6WIB7QM93z
         9CK/uUk62NCfDBbA5M4yAs/8XiVpyfo428URKix9lSenuOIduvCIuzrxPHwXWWKubWpK
         TRgvZGy1M246xoOLTBgMyKjbZbbKAdg7Ia5b9GECZSwg3f2OUG6FjnO5GhZUd8IBd/1t
         Y6+tVAUPczsRJqSqIl0YllRK/6fyItmZjQIiDAXCamN02xd/dL73EcRsCPO1TKN0YHmt
         UJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXimoYc7jZyn3unZqXRz7m2X4UOfOwHKKBLepdZssCrlOF8vp0ukLkBOcMwYsrJ/hIE46v90BDbWjq4MP/R7ysyph1wbzCJxueD
X-Gm-Message-State: AOJu0YzPb/Uq9BxueK4VRU0mZXmmZ0HddqCLGVnBqHQ1fy+IIx0xw+DE
	GoxvqZLnVGeCJPhQODP97bZcnENlh/VcfKrrvnFOO8m+iPuFEQS35qbrrrnE7AY=
X-Google-Smtp-Source: AGHT+IFlKP2V26sKFLbXdBHhJ4vN3oSCcpjqnWrWoKZQgexZ/zeATxrOgLq2EUFC6XTwAbG6JWPN+Q==
X-Received: by 2002:a25:ced0:0:b0:dc5:f51e:6a60 with SMTP id x199-20020a25ced0000000b00dc5f51e6a60mr272496ybe.6.1711355090037;
        Mon, 25 Mar 2024 01:24:50 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id g29-20020a25b11d000000b00dcd2c2e7550sm955323ybj.21.2024.03.25.01.24.49
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 01:24:49 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3271200276.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 01:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr/LE9xiA+h2Y+QWw2cfYioYC9lbV0ofMgzrbWvXNCaJOopRS8TT3B6u673x+QNFcISjrpBRCc8pwc0bad0rzqQnfv/X940rOL
X-Received: by 2002:a25:a2cf:0:b0:dcc:f0a:e495 with SMTP id
 c15-20020a25a2cf000000b00dcc0f0ae495mr4291545ybn.3.1711355089475; Mon, 25 Mar
 2024 01:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240124051254.67105-1-bhe@redhat.com> <20240124051254.67105-3-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-3-bhe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Mar 2024 09:24:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
Message-ID: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
Subject: Re: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting
 code out from crash_core.c
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com, 
	hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baoquan,

On Wed, Jan 24, 2024 at 6:13=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Now move the relevant codes into separate files:
> kernel/crash_reserve.c, include/linux/crash_reserve.h.
>
> And add config item CRASH_RESERVE to control its enabling.
>
> And also update the old ifdeffery of CONFIG_CRASH_CORE, including of
> <linux/crash_core.h> and config item dependency on CRASH_CORE
> accordingly.
>
> And also do renaming as follows:
>  - arch/xxx/kernel/{crash_core.c =3D> vmcore_info.c}
> because they are only related to vmcoreinfo exporting on x86, arm64,
> riscv.
>
> And also Remove config item CRASH_CORE, and rely on CONFIG_KEXEC_CORE to
> decide if build in crash_core.c.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
> v2->v3:
> - There's conflict when rebasing to linux-next in kernel/crash_core.c
>   because of below commits from Uladzislau:
>   commit 699d9351822e ("mm: vmalloc: Fix a warning in the crash_save_vmco=
reinfo_init()")
>   commit 5f4c0c1e2a51 (:mm/vmalloc: remove vmap_area_list")

Thanks for your patch, which is now commit 443cbaf9e2fdbef7
("crash: split vmcoreinfo exporting code out from
crash_core.c") in v6.9-rc1.

After this, there are still two references left to CRASH_CORE:

  1. Documentation/admin-guide/kdump/kdump.rst:

         Subsequently, CRASH_CORE is selected by KEXEC_CORE::

  2. arch/loongarch/Kconfig

         config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
             def_bool CRASH_CORE

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

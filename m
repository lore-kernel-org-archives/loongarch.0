Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D64A32
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 18:09:43 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r4so19054337edi.8
        for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=z1E8GnokuPUf7Vf8jyRFI0tVUIIyZ4+J29LO62NqtGs=;
        b=f7YWVinSY8ScIRzGU6IKFd1NVHvyN+OHFUCMQySl/7XI8jTIEO/r5Oc2amLrrPyIkb
         Yq9Lodmd2qHYkOGWQqVBFQjnzkuEXv8IPwvbOGA62FnA7BVt9ACIGyIOBNMA6u9tDI+A
         VgeBPNnVKcOJxRAdEckzFxiEJNdYLTy0qPiT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=z1E8GnokuPUf7Vf8jyRFI0tVUIIyZ4+J29LO62NqtGs=;
        b=MetfiwqpX1Q2VVXG0sx8AqoFwZM1swp9hcDdfrjJknsnOBvqrDMoFc4rQoI1F+AJhO
         rI6Nqnpr7qSHV7fVPwcOU1Tja/lYNsNJuI1oVz7vTt1DX3wkt8Jn0MSl19P7wPXFJS7f
         7WF03R5kg/BgUDMUdILmWClLBAZGzjGpaZG+AmC+wwis3NaX0Wev7zuMeeh114ZMNp97
         CUQUOV5H24kEhGdGQXO72Bb0Ilj7GDU/gYiAbocfrmTLnm1y225qmEYNjAJgbiLSxR5A
         32Tv2sTCZfiKozzhUZSmfW88d1B/6EsGutCJWlAPNukEFXOO80WYKVABw2sqJq4cixHI
         m2cA==
X-Gm-Message-State: ACgBeo1xppXZSjbEWI1pPio0Z+iziPsNJTYUNIoPaYP512i2chtnfLdV
	lsM8Y+XwOHcwdgABzXl0S4HxffJtLE3erh9J
X-Google-Smtp-Source: AA6agR5pL4GUPKcwz4+45BNtQmBpqcJpnRAsj0cZMM6Vtx77gMNcTkmxAnsWa/4VpMktY6jdD84aKg==
X-Received: by 2002:a05:6402:240d:b0:442:b0c4:9e02 with SMTP id t13-20020a056402240d00b00442b0c49e02mr4694667eda.210.1661278181964;
        Tue, 23 Aug 2022 11:09:41 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906539800b0072ae174cdd4sm157507ejo.111.2022.08.23.11.09.38
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 11:09:39 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id bq11so11380872wrb.12
        for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 11:09:38 -0700 (PDT)
X-Received: by 2002:adf:b343:0:b0:225:1a75:2a9a with SMTP id
 k3-20020adfb343000000b002251a752a9amr13812698wrd.281.1661278178479; Tue, 23
 Aug 2022 11:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YwSRFzQQKAXP2ncp@debian>
In-Reply-To: <YwSRFzQQKAXP2ncp@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Aug 2022 11:09:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjn1=Gyi3Jxw4V0A=fXpOu5e1StPoyu52A6DHmbT+auzA@mail.gmail.com>
Message-ID: <CAHk-=wjn1=Gyi3Jxw4V0A=fXpOu5e1StPoyu52A6DHmbT+auzA@mail.gmail.com>
Subject: Re: mainline build failure for loongarch allmodconfig with gcc-12
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 1:34 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> I have been trying to build loongarch as part of my nightly builds, and
> I can build loongson3_defconfig without any error. But allmodconfig fails
> with the error:
>
> In function '__cmpxchg',
>     inlined from 'ssh_seq_next' at drivers/platform/surface/aggregator/controller.c:61:9,

Looks like ssh_seq_next() wants to do an atomic cmpxchg() on a single
byte value, and the Loongarch implementation only does 4- and 8-byte
versions.

It looks like loongarch - from its MIPS heritage - inherited the "we
can't do atomics on byte variables", so that it needs the same strange
"do bytes as word accesses with mask-and-shifts".

For MIPS, the code is in __xchg_small() in arch/mips/kernel/cmpxchg.c.

Alpha has something similar, except it's all done in inline asm in
arch/alpha/include/asm/xchg.h (look for "____cmpxchg(_u8," in there.

Of course, we could just add a Kconfig variable like
"ARCH_LACKS_BYTE_ATOMICS" and make that driver depend on it not being
true, and just have Loongarch set it.

But I think loongarch should just implement the byte masking stuff.
Particularly since I suspect it can just copy the MIPS code as-is.

                  Linus

Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035481380
	for <loongarch@lists.linux.dev>; Thu, 30 Mar 2023 02:56:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id a16so15958146pjs.4
        for <loongarch@lists.linux.dev>; Wed, 29 Mar 2023 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680144968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcIEVyxOQ9ThEvdTZ3QimlrlYxsMccblwZq0nJEQf8Q=;
        b=Zec5lJk4rXTCbA+qbB6XLLMkQsH0baL9XmFKOIVsa6DGOJodAy/QjlUIPA+YuJnisG
         BLviy5bd66/mXjAw691bc1vI4BTemWYukYKjCZ1+jPr0XjLytUY1NT/zNqXehvPbHQ60
         u//4jHceldp9UErdH8WTE+kZplg5WaFpToTSV3UlAnqAe5F6GUY6hMTMdwhuQqDTtOD2
         u3vm2zcCg1Kk0SMP5H8FbNCOoU5dUs/LXyL76kqX2uLO96d7wuz5Ri66atDLcCfotByZ
         DA0qxNlVVaf2BFurz3bXwPR7biZ4WJlZrmKAdrpggFJhgH5bTzqvysSpK1iQKoTWivaM
         qsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680144968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcIEVyxOQ9ThEvdTZ3QimlrlYxsMccblwZq0nJEQf8Q=;
        b=yWCsPBrC6G9uCtXOeFXesAvIL74MVQak/ZeN5YV9ih5bbyOH5Ge57lgtOTSWKb5GgD
         Rox8QxL7iOcQo0lx8Elc3sdajKix/TvBd9vQtqA+l7qhiw7W/uDYfMKoA5dMxpRW5smW
         844gjQM9ARxfx2rniWJp64TeP3Zj/gM+PcyykOLfybmUqGstUKuaYUrwvCbNGNB3v2qX
         vcDsLlsqoDDNGw1cBfQ7Rn1y4gu7cJNX/82idRBgb/R0pPB9hyGFqpnvBzCC5UJI8RlJ
         9Sx/mPVc/Aqw2ed8YVhZdJgN2GnUv7OEg1VdZwq/xIl6G5tJXr4dPGxDnmERQS98SFVh
         rJLg==
X-Gm-Message-State: AAQBX9c1Ql0IOVlPXdWFIYrte6GyUCZkW2/FXpU83WF6tOCBG0C+CXXZ
	4XvJEMSol1bMkAMBJyxfXQuw0A+ucz4FSSfCtak=
X-Google-Smtp-Source: AKy350aaSitWK+oMnPBGI/HdGFv4oj337IShewGHsQKImjbS99hwBRaF/179UbwYduEu4LT8WrbvDdBJHlGFglrepNY=
X-Received: by 2002:a17:902:ecc2:b0:1a0:7630:8ef1 with SMTP id
 a2-20020a170902ecc200b001a076308ef1mr8673024plh.11.1680144968218; Wed, 29 Mar
 2023 19:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328111714.2056-1-zhangqing@loongson.cn> <CA+fCnZevgYh7CzJ9gOWJ80SwY4Y9w8UO2ZiFAXEnAhQhFgrffA@mail.gmail.com>
 <dccfbff3-7bad-de33-4d96-248bdff44a8b@loongson.cn>
In-Reply-To: <dccfbff3-7bad-de33-4d96-248bdff44a8b@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 30 Mar 2023 04:55:57 +0200
Message-ID: <CA+fCnZddt50+10SZ+hZRKBudsmMF0W9XpsDG6=58p1ot62LjXQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add kernel address sanitizer support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 4:06=E2=80=AFAM Qing Zhang <zhangqing@loongson.cn> =
wrote:
>
> > But I don't think you need this check here at all: addr_has_metadata
> > already checks that shadow exists.
> >
> On LongArch, there's a lot of holes between different segments, so kasan
> shadow area is some different type of memory that we concatenate, we
> can't use if (unlikely((void *)addr <
> kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) to determine the
> validity, and in arch/loongarch/include/asm/kasan.h I construct invalid
> NULL.

I get that, but you already added a special case for
__HAVE_ARCH_SHADOW_MAP to addr_has_metadata, so you can just call it?

> This is because in pagetable_init on loongarch/mips, we populate pmd/pud
> with invalid_pmd_table/invalid_pud_table,

I see. Please add this into the patch description for v2.

> So pmd_init/pud_init(p) is required, perhaps we define them as __weak in
> mm/kasan/init.c, like mm/sparse-vmemmap.c.

Yes, this makes sense to do, so that KASAN doesn't depend on
definitions from sparse-vmemmap.c.

Thank you!

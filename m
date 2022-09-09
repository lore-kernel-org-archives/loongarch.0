Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63F658
	for <loongarch@lists.linux.dev>; Fri,  9 Sep 2022 20:35:28 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 289KZ9tk024147
	for <loongarch@lists.linux.dev>; Sat, 10 Sep 2022 05:35:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 289KZ9tk024147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662755709;
	bh=rH1NP6uWb5FT/e2uz2unz8AGL349fphr8MvxQi9NiSs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VDA1FxXrDxd7dgHP4xK+4mvQiage/NY4J2C9vRyxdTbN2ZKC4lZP5SIi64rdLncc1
	 5428ez4kDdUQCfFIVQ2vxwCv8MO4WOHjQhzxIMc2KFP+x1nZmtMUXRfcru4rTZe5DY
	 Nj1Do/xgz0xEoLP2ISmUP3Du/tG7bSrMCASJM3YQuDzFKW1ermJbqHpkUptLVZY17J
	 yxU1n5q60KIgbTyFQRS2NI1AwrjTgi9IJw1A8ogQ9kXiuoTAwvH0pHxXqH2/o4xaeK
	 G4qpKHaH5VLuVu5q9/5hXyr+E61jASe/kXFeV6PiIUBdhWfVkOonE2xmTPgiEFgqe6
	 W095btzBJFPBA==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-11e9a7135easo6932440fac.6
        for <loongarch@lists.linux.dev>; Fri, 09 Sep 2022 13:35:09 -0700 (PDT)
X-Gm-Message-State: ACgBeo137bNhrnLDEdLBbQnDB/MM17zvVuRqgozllVmIfw/Ixu0oPKIK
	Lsb0oo0/wrlvhLgXihJCpJMvDd5q9zEiH28Xnlk=
X-Google-Smtp-Source: AA6agR6dL09UltxzlxRkGBfGKrUUYZ2bafO2jfFPKuEOiCf04AJFdBbWcLrwkKb2VeRhUwPR42iE5Q+EoGneHl3m+O8=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr5903018oab.287.1662755708354; Fri, 09
 Sep 2022 13:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1662030659-21558-1-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1662030659-21558-1-git-send-email-tangyouling@loongson.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Sep 2022 05:34:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNARn=v=ugnvYAeq2rfWyStZKkWQcbaaxSJdxrdHE20X31w@mail.gmail.com>
Message-ID: <CAK7LNARn=v=ugnvYAeq2rfWyStZKkWQcbaaxSJdxrdHE20X31w@mail.gmail.com>
Subject: Re: [PATCH] mksysmap: Fix the mismatch of 'L0' symbols in System.map
To: Youling Tang <tangyouling@loongson.cn>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        loongarch@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        Xuerui Wang <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 8:11 PM Youling Tang <tangyouling@loongson.cn> wrote:
>
> When System.map was generated, the kernel used mksysmap to filter the
> kernel symbols, we need to filter "L0" symbols in LoongArch architecture.
>
> $ cat System.map | grep L0
> 9000000000221540 t L0
>
> The L0 symbol exists in System.map, but not in .tmp_System.map. When
> "cmp -s System.map .tmp_System.map" will show "Inconsistent kallsyms
> data" error message in link-vmlinux.sh script.
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  scripts/mksysmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 9aa23d15862a..ad8bbc52267d 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -41,4 +41,4 @@
>  # so we just ignore them to let readprofile continue to work.
>  # (At least sparc64 has __crc_ in the middle).
>
> -$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)' > $2
> +$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)\|\( L0\)' > $2
> --
> 2.36.1
>


Applied to linux-kbuild/fixes.
Thanks.



-- 
Best Regards
Masahiro Yamada

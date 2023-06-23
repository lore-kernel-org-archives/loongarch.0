Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58C100B9
	for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 16:32:01 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-62ffb5f6aafso7382916d6.1
        for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687537920; x=1690129920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjZj3NJ6tNL43fD8olUI2ckbffSX6NxYGeL5Kbsd15w=;
        b=R1isnHBBwVrgX9qa7AlsKhyGqLKNWhaxQDytnzIrvagW7RrRJJd/7E4Jv7J5xW37fN
         ZJiwLTMzva5iBTSQRN1jHnvm4kJDixA4gECanSgwBdUDVFzAZjwVMSUrMribVOeO1dbj
         TOYp58RsjRx4zs5ztbwLxPDHKfGhf0vTGXUAWId9gmOVFHxaMvnIPglVs+EVJ/o8OQoT
         Q/H747d/lPF0u1HAY7OhMjerSUExP5JUZAm/zKMTRZqruSemOEYyLG3YUxumw03PcXVp
         bsn/lCwZMelCPLy8OoCoeyE14XDebACrCq2aNBWvsLUxah47fqSMBXe7gKKlKjwTvjtv
         EUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687537920; x=1690129920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjZj3NJ6tNL43fD8olUI2ckbffSX6NxYGeL5Kbsd15w=;
        b=gDHCxrvDYsMb8WS9JSmV6U/0+IA0ZqsIcEhnA46Euec88CiLdrTQI7CR7Kl17WLCpk
         wCBU4vRHqQ2db/8vsPl34VwcFRLFVw6UlkAFYlanO9+aVF1QxDwbFFHNrOdaykhBQXtX
         iH7BDkup/f6YjiduIvkxfi8MSNZWdqR02JqCGYwzGVbvS320oqlEQrKn53zdL9h31/KO
         qO/js/fSck23GSfpNs/NecDmhzUn9vNLbFoTZ1o/oOL7vhbTgp49Cv12JWv+wn8mmK0k
         vtt4evT310zKgJQfRHDC44ZusZ8s8f7SLrPTKpAaoFVhGHbYcT23addpIe/pQs/0wRxp
         Y4oA==
X-Gm-Message-State: AC+VfDyCfez+6pXdvAo/sLW+G6VXtXtteHlJPwnRhvUDz13/S4mDs4Jc
	hufsoENIbo5jx6Xi7uT5wUKdaK9tvoGY9uBDPAn+Vg==
X-Google-Smtp-Source: ACHHUZ44biYyPh1FafPEljQhdi4AermpdroWBXD6UfAZJZCAYGcnGRDXk1RfO12+Wn89bZ+YwJ3JJ2rnwlhgyM4rHQA=
X-Received: by 2002:a05:6214:2a8e:b0:626:3dee:6091 with SMTP id
 jr14-20020a0562142a8e00b006263dee6091mr26135505qvb.49.1687537919844; Fri, 23
 Jun 2023 09:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623134351.1898379-1-kernel@xen0n.name> <20230623134351.1898379-9-kernel@xen0n.name>
In-Reply-To: <20230623134351.1898379-9-kernel@xen0n.name>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 09:31:49 -0700
Message-ID: <CAKwvOdnimxv8oJ4mVY74zqtt1x7KTMrWvn2_T9x22SFDbU6rHQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] Makefile: Add loongarch target flag for Clang compilation
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Rui <wangrui@loongson.cn>, 
	Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 6:44=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> The LoongArch kernel is 64-bit and built with the soft-float ABI,
> hence the loongarch64-linux-gnusf target. (The "libc" part doesn't
> matter.)

Technically, IIRC llvm may make different decisions on libcall
optimizations based on the libc part of the target triple.  For
instance, is bcmp defined in that libc or not?  That's why we specify
-gnu or -musl (I forgot we did that for hexagon) explicitly rather
than leave that part of the triple blank.  Minutia that doesn't need
to be in this commit message, but now it's explicitly documented on
LKML and linkable-to.

>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 058a4c0f864e..6c23c6af797f 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -4,6 +4,7 @@
>  CLANG_TARGET_FLAGS_arm         :=3D arm-linux-gnueabi
>  CLANG_TARGET_FLAGS_arm64       :=3D aarch64-linux-gnu
>  CLANG_TARGET_FLAGS_hexagon     :=3D hexagon-linux-musl
> +CLANG_TARGET_FLAGS_loongarch   :=3D loongarch64-linux-gnusf
>  CLANG_TARGET_FLAGS_m68k                :=3D m68k-linux-gnu
>  CLANG_TARGET_FLAGS_mips                :=3D mipsel-linux-gnu
>  CLANG_TARGET_FLAGS_powerpc     :=3D powerpc64le-linux-gnu
> --
> 2.40.0
>
>


--=20
Thanks,
~Nick Desaulniers

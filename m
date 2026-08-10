Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5063BD63B
	for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372658; cv=none; b=RYuXGsXidU3zr4ocJBrHbJ7UUMp9qQOgmDWSNtTjiv3nr8sdnnTeIgqgVK6EuW0D42+k8INJXa5PQcdzSQptRCnubryhBT3fPHF6uwShUpDYyvYkb1Z2wKeA3yxF+twJ4EUj9+JA6LYOmxRj64WyZJpJxbXM7ZM2BbO+ZAiChIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372658; c=relaxed/simple;
	bh=DU7dD+AstrqC1zsE15YqewWXhNipog3/YOKaFtBzP3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLldt7Y0zcoGx4P6FYv5tYdw2agBsV8d8pMRPlSg1ozFRR5+QhqramRPt1EC4n9mfgdSnyjjx6VsdKrCa5XkM1wOfec5u6595gUqcQb0UEmBhbcu0PLg3I7veeubnUgkKwoAj8vllOun57oznWnO/+B3mkPWegjX7Kpgf7LAnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SArZK5TH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SArZK5TH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FC61F00ADF
	for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372657;
	bh=vAZICJ1VL+Q4P+HgVltfFci9gRl+OP2pT5x+XsJhMII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SArZK5THaqvLXQCuVVrc4Xw1j9zygKBZI9iYjKiiwBan6sDfP+al+k2f3fu/kYx4L
	 a/Ccl5sHHDhzybny8B1waIRawyLjQrXfsKP5gX4l+3eJTqaPLs12CclPQr7DklcoWZ
	 WPJ+4ZLPPhstBUJfYMaBlNcWT8cP9GWF4gVIYvQhXL3kqcsSxcNWNuyMo09atlZdrg
	 ccX8dM8oBl5XugXNdUSVXwYJ9NcP93BpFoTcxUcp9jImtkyRSNJrtrkqCbRPZEh7uq
	 zCfbNYkxR/JHphaH2+GBlHe+vMVPtXSEM5LcFNkNlYHWboqquri3GpcaohpeKDe4su
	 82BK15pOrkmTw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so3093552a12.0
        for <loongarch@lists.linux.dev>; Mon, 10 Aug 2026 07:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6KIbSGGdPmvR4MRXXYujk20YqKqPZjl4JWiL8AxfK6kJqfCQiZXFr8qhZ47ATMjc6KKp5XDovB1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIUI7fnQChUiQANGIpJpHuJD2gIeXknXBkfNxrBjHyAq4K1wPe
	eOrvRKH8d5w/2L+p580cv34WvLC0K1nfkYkk3TfLgBWuBCE/CRcgIdX2ibOCv19akU3eTBSAKuj
	+MCDM3WrrkGQdjZn87b3vk3M1TnVyr48=
X-Received: by 2002:a05:6402:52d4:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a1f23c2558mr10654266a12.4.1786372656379; Mon, 10 Aug 2026
 07:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807103714.33074-1-dongtai.guo@linux.dev> <20260807103714.33074-4-dongtai.guo@linux.dev>
In-Reply-To: <20260807103714.33074-4-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Aug 2026 22:37:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pK10ONo=viJyUJBiiFb_7pbB9LaNkQWH=83r+7E0iTA@mail.gmail.com>
X-Gm-Features: AUfX_mxGX4Nbr4LsOBcUqni8J7T0qO-yPY8u3j28Wab2hCSGdEOhPb7Wq76lg-Q
Message-ID: <CAAhV-H4pK10ONo=viJyUJBiiFb_7pbB9LaNkQWH=83r+7E0iTA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] liveupdate: luo_session: include linux/mm.h for
 virt/phys translation
To: George Guo <dongtai.guo@linux.dev>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	shuah@kernel.org, ardb@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	graf@amazon.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org, 
	Kexin Liu <liukexin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

This should be the 2nd patch.

Huacai

On Fri, Aug 7, 2026 at 6:39=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> luo_session.c calls virt_to_phys() and phys_to_virt(). On LoongArch with
> CONFIG_KFENCE=3Dy, these macros (in arch/loongarch/include/asm/io.h) expa=
nd
> to offset_in_page() and page_address(), both declared in <linux/mm.h>.
>
> Since luo_session.c only includes <linux/io.h>, the translation unit fail=
s
> to build with CONFIG_KFENCE=3Dy:
>
>   asm/io.h: error: implicit declaration of function 'offset_in_page'
>   asm/io.h: error: implicit declaration of function 'page_address'
>
> Add the missing include to fix these build errors.
>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/luo_session.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_sess=
ion.c
> index f38b5b18f3f8..31490ac7b63d 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -94,6 +94,7 @@
>  #include <linux/kho/abi/luo.h>
>  #include <linux/list.h>
>  #include <linux/liveupdate.h>
> +#include <linux/mm.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
> --
> 2.53.0
>
>

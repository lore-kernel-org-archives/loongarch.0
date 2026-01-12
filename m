Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF3346FD1
	for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209839; cv=none; b=BYfkrhEQbwqaGrrxv13mUOKsj0bTXGPNVAfdq+6J/Ilg9UU8wcSEk5UL6HJyVdYMvsaVWFXy7h3nzdSL9Dk24Z1LV7SEEQZ5NN45bdg+1+4brOJpNKASveq6A9slmrwCyvF5wYwL89rh8fHsKpDP/ni3uB4QyMrvH0fq36z/G0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209839; c=relaxed/simple;
	bh=h8p6HzMwTnGz8+/tWQUGIqpIFo7/UTaLeSRuhoxEu+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ8tCVNa5/Fh6lan7IsuE1LsvIG1zNpcLzP62oqOZL1NsjRh6H5gAV5KspbWouYUvUFZP3Zbdh6QaI0/xtZlxwX/g0qXVcTLV/Tq50ZCrNa0R1REy8g72e4C7VQq22R/gOyxAwBXafqWfmqpGDy2HtQ2FbPZ7xUBu5YituevoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDT7lyHF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDT7lyHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733CCC4AF0B
	for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768209839;
	bh=h8p6HzMwTnGz8+/tWQUGIqpIFo7/UTaLeSRuhoxEu+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PDT7lyHFyga1m0gMccTQdmS7LuoQelKtxqZDIDtJLliN53zyxt0gdKDsupZl1MlY0
	 KA4oEfAJ5eu7IswC+IunEmnFcJUhv+nxasthYqhJrO3dAWwOshNgMWoC7KSRtVSi6V
	 R3HcA04PHJhrWSElb9JhW6TQzLIzLuUg6QtjhZmkU13fb8JZWuCcot7Ty47TetRLSF
	 fYSm4rWzgD33MPZC0XaMaUIPHdNy72zU6UIjFrgnNsmi9QEanRn4pzcdXhHwWIo2GQ
	 cTCpXyIEp/CkQOr3U77RZj6XTLK+RihDFNS4OQ3oa8fI195r+JMK+GvZiBuyooH0z7
	 LtSrmgQfNK2DQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8010b8f078so1022116766b.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 01:23:59 -0800 (PST)
X-Gm-Message-State: AOJu0YydHTAhplSvh7NakdupQ3r0zuwE0v8RkrpNeWOvr9RqHzC1i4Kh
	lcUmoT/ImtwDSBnVfpENewXZ991kbBPK04yFWcCPjS2fGkQTAikaIkLTFAKLpFffMcRaZOEaVtF
	5qdjSorSTsIg6Luhdv5DMxFyRssW+GFA=
X-Google-Smtp-Source: AGHT+IF5fwZwBVkTrXDRsl1u4ZLcynijRT059DLq2H9ot2RBkSuhPr2ZEqMitb4WHffgHdfu3zc7YyEoDc0r3k/eaRc=
X-Received: by 2002:a17:907:94cd:b0:b77:1b03:66a1 with SMTP id
 a640c23a62f3a-b844517a078mr1801561366b.41.1768209838014; Mon, 12 Jan 2026
 01:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112091531.12735-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260112091531.12735-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 12 Jan 2026 17:23:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6xLX5ZjVKV9bixN=PT6p47JheDU4pYtqeo-=2BSnQkRg@mail.gmail.com>
X-Gm-Features: AZwV_QgrS_3ROi83aicyZrvmLFeMoxmVVWxDiX2XQbzEDSaPYoy_1ihDqA_3Bac
Message-ID: <CAAhV-H6xLX5ZjVKV9bixN=PT6p47JheDU4pYtqeo-=2BSnQkRg@mail.gmail.com>
Subject: Re: [PATCH] Revert "LoongArch: Remove unnecessary checks for ORC unwinder"
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Mon, Jan 12, 2026 at 5:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> This reverts commit 4cd641a79e69270a062777f64a0dd330abb9044a.
>
> The system can not boot normally with the latest kernel 6.19-rc5 under
> different configs, commit 4cd641a79e69 ("LoongArch: Remove unnecessary
> checks for ORC unwinder") is the first bad commit since 6.19-rc4, just
> revert it first before finding the root cause.
Can you show the errors in the boot log?

Huacai
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 8a6e3429a860..710f82d73797 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -352,6 +352,12 @@ static inline unsigned long bt_address(unsigned long=
 ra)
>  {
>         extern unsigned long eentry;
>
> +       if (__kernel_text_address(ra))
> +               return ra;
> +
> +       if (__module_text_address(ra))
> +               return ra;
> +
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
> @@ -369,13 +375,10 @@ static inline unsigned long bt_address(unsigned lon=
g ra)
>                         break;
>                 }
>
> -               ra =3D func + offset;
> +               return func + offset;
>         }
>
> -       if (__kernel_text_address(ra))
> -               return ra;
> -
> -       return 0;
> +       return ra;
>  }
>
>  bool unwind_next_frame(struct unwind_state *state)
> @@ -498,6 +501,9 @@ bool unwind_next_frame(struct unwind_state *state)
>                 goto err;
>         }
>
> +       if (!__kernel_text_address(state->pc))
> +               goto err;
> +
>         return true;
>
>  err:
> --
> 2.42.0
>
>

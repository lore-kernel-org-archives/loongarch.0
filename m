Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8D134A4
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 09:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5611FC433BF
	for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695720435;
	bh=f1VR1cPsKiZEfMZ4xmQmf1dSo/TmQTqpOYPK0gtgMWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qJM6u/ydoUUlSTcDZCJ5RvpbD+zwPn4JUk0BqY+u7WHOUdCVCq/DzMu6/ToueXAT8
	 mPEQwo62KGty+r+QPeslko/YBLrzLRHV+Cz/IWMdAAVIVh8GaXgy83jrjietvM7pD6
	 iQYXlcn7vGnmRJYJdBRCkSVXyP2L7/BF0Y5xzGWPtNLrBi40xy0qMGw0anbjOxvXL3
	 8vhSMwDFJh+TLFMX92xo70V7GT7oM1BVoPZBprQW4Ad/y0mVQAwnPqRQbpZrF4q7uA
	 cZCa7lmVDlJp8VwE7ddF9fFkUEegCA/SMAcJawoGpGMuaRHf41ZKVv2Bq95EMAY10/
	 zyi1gxBb+9yvw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-533d9925094so6111981a12.2
        for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 02:27:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YxDp6fADmLYjeQ/vFvzkbUIiiaOwj9sTdhn4xSs4c+iHmQmGqMy
	fW0R6RMNPImnDbtkFN0U6cUy6e7ys/AM0qNfmj8=
X-Google-Smtp-Source: AGHT+IGH5mmzJnX8yukfh9EAV11DcIjqWDnDfW/6ZG+lDlbrYo8U8qt0Bt96vUVymM1cAyk8EfcXfEnc1a1+/P0tqgQ=
X-Received: by 2002:aa7:d584:0:b0:522:3849:48d8 with SMTP id
 r4-20020aa7d584000000b00522384948d8mr7371489edq.9.1695720433743; Tue, 26 Sep
 2023 02:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1695715852-15902-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Sep 2023 17:26:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7B7ZZvUHS40WgBkXhxhdMDhOr=MGTi_75OSAT_zU_=cg@mail.gmail.com>
Message-ID: <CAAhV-H7B7ZZvUHS40WgBkXhxhdMDhOr=MGTi_75OSAT_zU_=cg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for 32/64_PCREL relocation type
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-fixes, thanks.

Huacai

On Tue, Sep 26, 2023 at 4:11=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Tiezhu Yang (3):
>   LoongArch: Define relocation types added in ABI v2.10
>   LoongArch: Add support for 32_PCREL relocation type
>   LoongArch: Add support for 64_PCREL relocation type
>
>  arch/loongarch/include/asm/elf.h |  9 +++++++++
>  arch/loongarch/kernel/module.c   | 22 +++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>
> --
> 2.1.0
>

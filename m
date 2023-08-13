Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB52564
	for <loongarch@lists.linux.dev>; Sun, 13 Aug 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4648DC433C9
	for <loongarch@lists.linux.dev>; Sun, 13 Aug 2023 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691947221;
	bh=4XjJ/m1q8Bs92xYp1IMaLNP82sMw8APWOQV52SF+PY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BAxuFpuXwCCDvy2GqC3juGxG3ZWWR24UXBAQFTvHjtPXP9mpCfEfmiH0CsvINue34
	 AKNe6DBNYmljF9cazzkMmgLEZYpvmtuIb4okXMhgZCKGEYa0kAFWCN226dgzv97G5l
	 K9bSymGJLp+8FFjwTrohpn1cwt9g1t1+AXUbyu0RXtPY1qlGDg0HyfgNHwtjiRWkDY
	 CxWEYd1fKdUIZEMUeE1S1wVraQ/5SanvKsCQ/9ZW7XEgFrZcr0Y2dfycwK8t448BYa
	 3GHw762q8tBLaP4TKWUfVYdyD4aROanIBS80JHtCfK3T2gP/oIKCULU2wjbg2OSluw
	 hU83GroB2NlrQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe28e4671dso5536676e87.0
        for <loongarch@lists.linux.dev>; Sun, 13 Aug 2023 10:20:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YzsNAE+YX8K17TajJUaDyJoI4qPLkmjaJwbzZi+GwM9N4zvJxIJ
	ksPpAaNpyLRqacx/teZzT0u6kWxd//Iu0ULWcnM=
X-Google-Smtp-Source: AGHT+IFiLEp9CF0ecmdJzWRfveOAbYiAjQhrssR/IIlpTn4KLDoA7SQlBMgIFFB33cO5A/k745EPwfJcHOV85lr4nY8=
X-Received: by 2002:a05:6512:33d5:b0:4fe:3364:6c20 with SMTP id
 d21-20020a05651233d500b004fe33646c20mr6003187lfg.16.1691947219316; Sun, 13
 Aug 2023 10:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230804124611.2051048-1-kernel@xen0n.name> <CAAhV-H681+pput57E2vHz_V7A_oNy1Av6aCDN6eP0wBQqo7kAg@mail.gmail.com>
In-Reply-To: <CAAhV-H681+pput57E2vHz_V7A_oNy1Av6aCDN6eP0wBQqo7kAg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Sun, 13 Aug 2023 21:20:06 +0400
X-Gmail-Original-Message-ID: <CAPhsuW5J_wUGmU+1tvzTqmpJSRrJicXoNmp+-ftDuHuhBcbkqA@mail.gmail.com>
Message-ID: <CAPhsuW5J_wUGmU+1tvzTqmpJSRrJicXoNmp+-ftDuHuhBcbkqA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] raid5, raid6: Accelerate RAID math with LoongArch SIMD
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-raid@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 7:27=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Xuerui and Song,
>
> This series looks good to me, if no one has objections, I will queue
> for loongarch-next.

Sorry for the delayed response. This set looks good to me. You can add

Acked-by: Song Liu <song@kernel.org>

Thanks,
Song

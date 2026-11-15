Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737235;
	b=tFFnEyg9K+Vak8tFVbZhMAkgma9RsqptNygXaxbHEmkTmsGXc37997P40L/G9TlqKfZ+
	 fsPTk26NBdFdqYK5w1UuwhMbZZIPfE0xUOYTGKLUL1yDaR8sg4cfsIA09OHQS1l9y/Qgd
	 i5Iu8x9svlGL8y59RkZOYPROH4CdCXjDIZ8VXgNh87jEQNPOcpUYaUvfRr1AF3/tlIz91
	 ebmJ8rUZJyjt1DXlT/i3W3i/6Wm0GqPfBA6EX8kwNabKLdefhMIIYZ0vgSplyHzbIJbEW
	 vHh4JXvHIpNN0OpHthNegdsoz9Ut76jxK06NLcU7b7jVv2z/MnGoN24sv+UHGpnwX4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737235;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	b=oczUvbgO1+RP5swcmGu7d+1ht82gtwjckWYf5z7OF3U6vhc65nwf5Da5C3yI062U0God
	 +vs0NuaYcMs3k8D8J4LjT4vDd1Yt5Z+i4V8an2RsK4l7Wn7zIQnqr1kEFfAv6DocsrUvr
	 dvkM+7qNPwk24hnwJTERYC53sfK8JLuplP5E3iR2D+hCUzMJ2QEZu/KMRgICJ/2X7qHxF
	 RteISn7YpRPLQZ0gD8Js+H22Iw/IHv05cmJCo+OP9zbSlPmEMUtsLYKwnFBItMWNIGUID
	 xWAunSRNwBp9ZVX1ra6pMfYWtXh6zTZ0pkOOCWddyH2aNbajq/fsrSamz532ivzZQFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F862606A31F
	for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 10:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055FF1F000C8
	for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737230;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ffULzAqtUK7kI4kzvHl1JdD6bHzKJ7H17fEJCLFK4rJN2W25ELqwOuy+22FRsAnoP
	 EwzXFKs+GQlpSCw9KRwbQyqfuoffTGjkLKnXpoSAc77jX1QZp2ZjSqfcwFdA0QHpQG
	 xkCbuSGmElOVvo67dSqfBVeRIfZVyJ+YYxbHjASYJyV+hL83tTTm71/mmEIM0S1C3W
	 JxtRObjt4H24/Pq0bR5r/7wuLxxPmQ/CqkG0o8ggPCFYvHGsYz151Bxo2moxz7rqw3
	 +FRYVmSRGs8jQDXMPZqoP6AAMIA98VxTfRvLr/XcS1JK3I62ueosjqdXsdYCOOgmt+
	 yw8uIR/3a01uQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso3831890a12.2
        for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 02:07:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkuRptueyXLXcelArHrQnHjFQ1N2sUIyQrNQ5sYANHILi6jPz7wDYK7S+zlo34nDj8aLBDuEA2sgQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+eHKtfavO4r+DySkMCWi2MjgMIAAbw8hm43v5K9t2MCH5hi/Jb
	zvXbuuyyqkuNEQoKjcMxXiKpL9Z+fki/NRiXiHFf34yW4S29JAoxe38spaUxczPVkRWL/4FLOQx
	vxw+Maln5FmO8gC5Qhvzf4xLUXrmFsjg=
X-Received: by 2002:a05:6402:42c6:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fac2mr6104789a12.35.1794737228536; Sun, 15 Nov 2026
 02:07:08 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792988985.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Nov 2026 18:06:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
X-Gm-Features: AclHuK8xpqb4LMAXdAN5nwsCuwWH11cUlBYujIxrgNPO5PisqkyzXwB5SmcGFG8
Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] loongson2-apb-cmc-dma: Fixes issues and pause/resume support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Mon, Oct 26, 2026 at 12:31=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> This series fixes three bugs in the Loongson 2 APB CMC DMA driver and
> adds pause/resume support on top.
>
> Thanks.
> Binbin
>
> Binbin Zhou (4):
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap
>     NULL dereference
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix residue for queued
>     descriptors
>   dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when
>     advancing sg
>   dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support
>
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 134 +++++++++++++++++--
>  1 file changed, 124 insertions(+), 10 deletions(-)
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>

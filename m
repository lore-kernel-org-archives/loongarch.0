Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627A23DC
	for <loongarch@lists.linux.dev>; Sat,  3 Dec 2022 10:58:32 +0000 (UTC)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 93414536;
	Sat,  3 Dec 2022 10:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 93414536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1670065112; bh=IaLxs+J9hAFkKyYzKX+A7hLkgWgPeWlmrS5nyJKqIfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cSjJxDE5n4TAq9/xyqsXCwgNfNEEu0GHwhQM75DmIX7qXuVYofj0+syxt7D0VCard
	 9kC3Gt5IkjaQck1DbzgXcNOauD+TWvaBF8yIvk3xdtNB1HpVh5p2vyZl+5ULzZh6SZ
	 Qrktg7ryv8NLvF04nOl7i50yyEe0WqzM9Y+e5BKE6GqGLkDZvY/+CnvxP8M7a7mus7
	 MNOgg+b7tM59J4Eni/zoyJhET+EWxXrEYJqhvEyGz4KdKbUSPaHF4O1vvhO7NKLfUN
	 UewZbclpbPfBlQ8gcNaTOCP40MM8nsSobsfcwygGFyRqY38gtudjF0D2b/JXs12uDi
	 2qiJLi2oGHLzQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Update links of LoongArch ISA Vol1 and ELF psABI
In-Reply-To: <1669892345-7763-1-git-send-email-yangtiezhu@loongson.cn>
References: <1669892345-7763-1-git-send-email-yangtiezhu@loongson.cn>
Date: Sat, 03 Dec 2022 03:58:26 -0700
Message-ID: <87h6ycoist.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tiezhu Yang <yangtiezhu@loongson.cn> writes:

> Tiezhu Yang (2):
>   docs/LoongArch: Update links of LoongArch ISA Vol1 and ELF psABI
>   docs/zh_CN/LoongArch: Update links of LoongArch ISA Vol1 and ELF psABI
>
>  Documentation/loongarch/introduction.rst                    | 8 ++++----
>  Documentation/translations/zh_CN/loongarch/introduction.rst | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)

I've applied these - working links are better than broken ones.  I
assume, though, that the new URLs, too, will break the next time the
manual is updated?  Is there any chance Loongson could provide a stable
URL for the current version of this manual instead?

Thanks,

jon

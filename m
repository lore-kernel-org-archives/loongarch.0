Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341918BC3D;
	Fri, 20 Mar 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998202; cv=none; b=udk/Bip45MZZPWXC2amET15QTdXWAyPMdQ6nAhw4LqyCtALNu1XLudrndGTz/lVQd/BL9bdh0PfMGe8HPrF9R+SijWe7w9CkEUsfEv53cRWFvxEcn4ERGSbiAttPJDi5lK2/dRWd0P/h8drYpLCW5wGd/B2ek2buC8xeQbhE0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998202; c=relaxed/simple;
	bh=zh4+UI8kA7wRoXXVv29tWrQCe4PAACgxeIACpvnp/64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ot5zuEdVEUXfS5leadZLzDxkend+bxizzAq71ipbXCgt1FGtb3bpG+4mP5QG7zYvi/gI0DofWgphBxVrprX0uiIFgT7ctwR3HSECn7s+ydxTUS9NApC+7sXmhTzlJ4tp06ar6DvKRSyepO2iOTN+OP/9YdfS8k084meOudK+nyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYxkaLnD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYxkaLnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8E6C4CEF7;
	Fri, 20 Mar 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998201;
	bh=zh4+UI8kA7wRoXXVv29tWrQCe4PAACgxeIACpvnp/64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SYxkaLnDG8dPHDBG+MAJICsgC7YR3mdQg9CZWTQYCqaNau0mXxf2CnWOB9uXSktS0
	 cSPgVY981Er4dj6cVN0eFl6D+AU59Tb6d5ctq1V1yOGDPMhaW/YxkOQSjHwP4Z2lcI
	 DMX3+hUe5dILV9xRJJyALBkvwRnM6Edf0N9nygHy9ochlmtX6ZhZ1PEkoU5TFs9Tki
	 C1YEUUOdcfaPXixA25SzuefRdsdt9CR+dzDh01+XgIdL3G6GfGQbJkaipUst9RghLi
	 laaeAl9qone3tk9YKVAgq5P830x6RHiWse2yjbAgjOnzhgeasB/KRU4/NUUoOf0Gmt
	 M9zeFPw0+T0BA==
From: Thomas Gleixner <tglx@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>, Yao Zi
 <me@ziyao.cc>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
In-Reply-To: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
 <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
Date: Fri, 20 Mar 2026 10:16:38 +0100
Message-ID: <874imalv2h.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 18 2026 at 21:57, Huacai Chen wrote:
>>   MIPS: Loongson64: dts: sort nodes
> s/sort/Sort/g
>
>>   MIPS: Loongson64: dts: add node for LS7A PCH LPC
> s/add/Add/g
>
> In addition, I think the last two patches should be in another series
> because they won't go to the irqchip tree.

Correct.

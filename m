Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D12765F5;
	Mon, 18 Aug 2025 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532528; cv=none; b=El7Tyj9K0U5IkgXwXl0G0NLzqtbK6qKHW1Erou/ueXkFfJp/lFHTkLJ53wCxR7N1eD7i9GYwfRfHnW5Mz56LWGDoKUV/di2bYn/hZBhjQnXW87wBX6zAudf429n+7F3KH1oZXO7U+ZlqBl4k/22q0+B907FoRXrqCiKEh7cz79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532528; c=relaxed/simple;
	bh=xKr1rCiwUqIXI8QwBa6YH9SvSvUWEf9h67156BGMFsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3WzCa2Xi1qCQxQdgqRMQeHSZaZHtGCadEF7uBu/Be6jzqqTu/a1lmPfJmqzNaEvw/1YJuGmsG6GMES3vps/07JyuCkAKisZIDIal+v5juFQOZrBjPLZt/8UUP7UseiBiYhFz8LKgge7kzSjJuL4h0sar/koYWwJS+VTxnv0dlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY1fTk78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hY1fTk78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A487CC4CEEB;
	Mon, 18 Aug 2025 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755532527;
	bh=xKr1rCiwUqIXI8QwBa6YH9SvSvUWEf9h67156BGMFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY1fTk78r5Mg09w6ATvOScvntsKcpQ54EuKLoMIs8bf9X+iNeXuEbj/NJQqO5NTce
	 hATud+7OJVFO1HgYyM5WvKm2fjJzT8CAdcxx5Vqbn1jHN8wsU0b/2KbgQoVfkQDipo
	 yNn7BxJ5nOuYiho2FBjDpGG43Nb7lGHdS7l48Yd9YaU8djK5ABINoUVQVsMGVn0Ue2
	 3ZxJCxpjxH0nTFaV7/ATdKYN7EZ4M8nOkvq0WwHgJcbh3BWw8PiFDKQ1nsfVscEk9E
	 6UHW44ocAaiPovndUTj0FFv/VnbYB5ud+KVJssZ3KMaU1yKC3stCVUKv+/6MLQiDzn
	 l7yHsXqTvFZvw==
Date: Mon, 18 Aug 2025 10:55:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mtd@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Binbin Zhou <zhoubb.aaron@gmail.com>, loongarch@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
Message-ID: <175553252642.1298621.17529958231132657783.robh@kernel.org>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
 <e6568dad8dfc1c2fba6b31a1fbb113e82f8c5da5.1754890670.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6568dad8dfc1c2fba6b31a1fbb113e82f8c5da5.1754890670.git.zhoubinbin@loongson.cn>


On Mon, 11 Aug 2025 14:03:14 +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K1000 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/loongson,ls1b-nand-controller.yaml    | 50 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


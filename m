Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A06156E6
	for <loongarch@lists.linux.dev>; Wed, 23 Aug 2023 19:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9C6C433C8;
	Wed, 23 Aug 2023 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692819772;
	bh=g4DHsYkZGlPpM5rQIQD5TCWHs/5iMzUtmQt0dwpuYqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTjCXBULpIQHKfnAn6WBFXrjhPONY5ODxQzl/v3FpfBm8fUaTO5Hx+n34Js3Y6PVk
	 pezz/tOWeWXjkpBjZgqShIVxJ+RtqE5Vz1/YrbEcWwJuPAQbRVO6MWQdb49ZUTklKR
	 vIDI+KWVlVJMo0IvCjKrFN5yVzxluSPSY3uPFz909en2WNk5wGHMb+QS9xvm4R4YRD
	 PQzchCZeoNp8WY2kpqDxHMKBtkmHpsKH74rL6Njf9+tKDPxwM6jCbJoigD9Be5mryL
	 k0E0fePx9xyb3hafAa6RapunJm9JKhcDmjcSPQcRnyGYNslwqIIOBcqXQwrrdmgPzq
	 vFI0tUAvhteFw==
Received: (nullmailer pid 2772251 invoked by uid 1000);
	Wed, 23 Aug 2023 19:42:50 -0000
Date: Wed, 23 Aug 2023 14:42:50 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v4 3/7] LoongArch: Allow device trees to be built into
 the kernel
Message-ID: <20230823194250.GA2768550-robh@kernel.org>
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
 <3e69929008c8190cff331941dd4d34f748e5e44a.1692783907.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e69929008c8190cff331941dd4d34f748e5e44a.1692783907.git.zhoubinbin@loongson.cn>

On Wed, Aug 23, 2023 at 05:54:51PM +0800, Binbin Zhou wrote:
> Some systems do not provide a useful device tree to the kernel at boot
> time. Let's keep a device tree table in the kernel, keyed by the dts
> filename, containing the relevant DTBs.

Support for this in other arches was added to support legacy bootloaders 
with no DT support. You should not need this for a new architecture. Fix 
the bootloader to provide a useful DT.

Rob

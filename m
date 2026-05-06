Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC81A3157;
	Wed,  6 May 2026 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032075; cv=none; b=CimGDUQy6od52koCAlFtl/gbuuNhtbweXyrblAGY0CL11SDsZHCU1RNccLhKsBHgThO1KQr2RU9+Z6jTbFQMNPGfz0V2rJdTKndZCqZWFkvYi93cSVPqf8rbvo2QFBhXalsYET7ftKojvYQ0zx88fU71zOsyXLgMbCl/dXwTdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032075; c=relaxed/simple;
	bh=dq4n2rXi6bWQ/HXhC18pEK/hPmy2rLxTxVTfaCPfj8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWDSAjfWZjXUlvSi0vAnwOT3BX7+9N0Jw+nDExssk90iRzsuNrdW34fdE3zUCVCtV/SvRIb+kw1ZXj4OO2kTij392AGCcxW/7xL90NiDJPr5ghxKWYJyIuPkAy8nQMgj+abOHYx5kwicWRBS+WWg+IGlaTbPhs7WWDe+QuFF67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdyS+2DL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdyS+2DL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE19C2BCB4;
	Wed,  6 May 2026 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778032074;
	bh=dq4n2rXi6bWQ/HXhC18pEK/hPmy2rLxTxVTfaCPfj8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YdyS+2DLodBz71jljKCplG4FZBljdfyl2Rw0roX/XQ85aOtU2I7CcqNF2A0kG5A//
	 NzyKhanO+oBs1GKJZ/+jVaIKfFY1ZBu5EXHaUhFVvqz6fwAGFvkin91L8ubjNXtnh7
	 o25ZvGb8CQLR9N4h85xEbobLDSeXWT/n1Q6fa988WYtAIuPdBY1VEZwO7nD4RnobgI
	 hyBa9xCzUrYXv2WXolzNYAFjhR6OgRye3m/99B2127B4m11IA4kwZI6hPk2QBxAwE3
	 wn65bgWJy/bPSIzurdvUiJVpeFoe6RVWkqcBEpBwZLwzQd1mqa4EEK201gJwibItot
	 gn/oAoZtWy6wQ==
Date: Tue, 5 May 2026 20:47:52 -0500
From: Rob Herring <robh@kernel.org>
To: Chen Wandun <chenwandun1@gmail.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
	chenwandun@lixiang.com, zhaomeijing@lixiang.com, everyzhao@126.com
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
Message-ID: <20260506014752.GA280279-robh@kernel.org>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065831.1510858-2-chenwandun@lixiang.com>

On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
> When a reserved-memory node contains multiple reg entries (e.g.,
> reg = <base1 size1>, <base2 size2>), the count used for
> total_reserved_mem_cnt is wrong in two places:
> 
> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>    many regions it reserved in memblock. The caller in
>    fdt_scan_reserved_mem() then increments count by just 1.

Just to make sure, more than 1 worked before the referenced commits? It 
would be easier to just define we only expect/support 1 entry.

> 
> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>    only reads the first reg entry. Subsequent entries are never
>    initialized via fdt_init_reserved_mem_node(), so their metadata is
>    lost.
> 
> Fix both issues:
>  - Make __reserved_mem_reserve_reg() return the actual number of
>    regions successfully reserved. Update the caller to accumulate
>    the returned count.
>  - Rewrite fdt_scan_reserved_mem_late() to use
>    of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>    initializing each one via fdt_init_reserved_mem_node().
> 
> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")

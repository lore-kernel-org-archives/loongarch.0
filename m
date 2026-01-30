Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104C353ECE;
	Fri, 30 Jan 2026 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761235; cv=none; b=tNd4LEtHtMglGepqfAoAj5XnFnQ9KexdYxOEKXnGKMcJ7f2K11aAPMXAEtSx0FbLoKBB84Zs415zkuPmlZvrdz5AT/1it3YJ8CSWdzZUvpAY/IrgyWlWze6l/rrKIULGO1PWj5bYfYcK6P3ff7Y66Ub43oWm0wEgMrV7ltbOe78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761235; c=relaxed/simple;
	bh=G/ZOZMAe/12yPcUH9ozNnrWhB5fKbuqSYi+7AFxK804=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eyKd4+ep6pUlSdcjaKRmvOsMTHO7xxhbEm1jvshSS1zh+wR8uvrrjr9CDKC6KSIk0fSAU6L9Dej4ilQsUK+XKOXLKtZ7v2cjDJpptATJBs3m0ZqL1PrNmFH39djiWAii1KH/+uq1AnpwLAVxkFmgNUcg8BNbZH2qkCehAVcdfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYpJPDhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYpJPDhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF26C116D0;
	Fri, 30 Jan 2026 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769761235;
	bh=G/ZOZMAe/12yPcUH9ozNnrWhB5fKbuqSYi+7AFxK804=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QYpJPDhkaMmOD71MNUHDKPpY6dOBWotypmYNrLAndtGBr/69hr9if2m4NdINW9hwk
	 3U5Jw+P3DFInLwNxBK/ABZbheDrsduBJ4VuoWquaivAcnT5fa5dBKSIIiN64gKuSNW
	 woc4W0kCVuOUoMI+DtzCiVNuTAiEtSznzN6Es7zdPh7bc5tEDaim0jI5PcA5ZuQeLV
	 sLSl5OAhuPT499pMnc7vJUIpLwIqCJp9Zz2/ePpsfFOB4MWCv3ARRBprtlFFYQxA3a
	 OwheKBhl2GG6f34JYxXG6gcv8Mqw3HVGWSjHSG/wLMoD/yokvB2bf1PkAqmbEATcx/
	 r8Rzlh+WtDGfA==
From: Thomas Gleixner <tglx@kernel.org>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v9 3/4] irqchip/loongarch-avec.c:return
 IRQ_SET_MASK_OK_DONE when keep affinity
In-Reply-To: <20260130025941.2140582-4-zhangtianyang@loongson.cn>
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-4-zhangtianyang@loongson.cn>
Date: Fri, 30 Jan 2026 09:20:31 +0100
Message-ID: <87343nmrzk.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:

  irqchip/irq-loonarch-avec: Return IRQ_SET_MASK_OK_DONE when affinity is unchanged

Note the space between 'prefix: ' and the shortlog sentence

> When it is detected in avecintc_set_affinity that the current affinity

Functions are denoted with fname() to make it clear. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

> remains valid, the return value is modified to IRQ_SET_MASK_OK_DONE.

That's the very wrong order of explaining the change. You again explain
the _what_ first without giving context and reason.

See the above link. It provides guidance about structuring a change log.

> After the introduction of redirect-domain, for each interrupt source,
> avecintc-domain only provides the CPU/interrupt vector, while redirect-domain
> provides other operations to synchronize interrupt affinity information
> among multiple cores. The original intention is to notify the cascaded
> redirect_set_affinity that multi-core synchronization is not required.

"After the introduction.." is confusing at best.

> However, this introduces some compatibility issues, such as the new return
> value causing msi_domain_set_affinity to no longer perform irq_chip_write_msi_msg.
>   1) When redirect exist in the system, the msi msg_address and msg_data no
> longer changes after the allocation phase, so it does not actually require updating
> the MSI message info.
>   2) When only avecintc exists in the system, the irq_domain_activate_irq
> interface will be responsible for the initial configuration of the MSI message,
> which is unconditional. After that, if unnecessary, no modification to the MSI
> message is alse correctly.

Spell checkers exist for a reason.

Thanks

        tglx

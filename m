Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8D1F4178
	for <loongarch@lists.linux.dev>; Wed, 19 Feb 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974010; cv=none; b=Ky6J94k1BbOFuWypzg8o9m61/faWPM/7fIYxV2DK9WfE2lVBgbRyNn+UiLHbEG1q2tj8zYCgvvLTfnD9Q0jkxH92YLsyOWj4mH3GWNBckRQBy1WhfOAWV/iVctw4+7IOVRMS6KBUJtEWYZ1NtlPJ8jNDEdB+MTHrLGmQKKmKSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974010; c=relaxed/simple;
	bh=CIMKBpM/otj/+4OgQScDBpEp7jJhRHbiXbYzvPVbUbQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=OpO1hAE8I4RLNp2yJUgAn8G+K3saSopV/iTEMlJTMfm9MAN7WRnA6JTRoCmpNIYuQdkz3YOIk43SxxihVsitpW2IRS4qbV6sVLgoZuUahv28Vnuw1KSBlBRXUkm2ax2bo8t7sRsGDsq0EPFjHOnrwm9II51VIqflBJU6UO1HhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD261343050;
	Wed, 19 Feb 2025 14:06:42 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com
Cc: arnd@arndb.de,chris@zankel.net,dinguyen@kernel.org,glaubitz@physik.fu-berlin.de,ink@unseen.parts,jcmvbkbc@gmail.com,kees@kernel.org,linux-alpha@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-csky@vger.kernel.org,linux-hexagon@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,linux-mips@vger.kernel.org,linux-openrisc@vger.kernel.org,linux-parisc@vger.kernel.org,linux-riscv@lists.infradead.org,linux-s390@vger.kernel.org,linux-sh@vger.kernel.org,linux-snps-arc@lists.infradead.org,linux-um@lists.infradead.org,linuxppc-dev@lists.ozlabs.org,loongarch@lists.linux.dev,mattst88@gmail.com,monstr@monstr.eu,richard.henderson@linaro.org,sparclinux@vger.kernel.org,x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250218175735.19882-2-linmag7@gmail.com>
Organization: Gentoo
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Wed, 19 Feb 2025 14:06:40 +0000
Message-ID: <87cyfejafj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Lovely cleanup and a great suggestion from Al.

Reviewed-by: Sam James <sam@gentoo.org>

I'd suggest adding a:
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

thanks,
sam

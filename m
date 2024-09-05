Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D725570
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505982; cv=none; b=hO3tH6yKzqdItfJAPkvmJfky6xmBDEx3ApT3AWlutF2H+CvFtGuyKJM4Pb0w15luCB73aRov5atTCpT8tEQUrjH4nz06l66IkODaIhfEkhrQLGpwWO5/dUj0iOwOY7M0ryyqHEPa/dfyqsKogLLCqJjS9hIUPUpvP2sU1c1kWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505982; c=relaxed/simple;
	bh=LMfGt6J/NNVaYrcyRj9SBGWanLl1kVocxpUBK1DmGHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMnPXKB491BCWW7Lt+OJt/JK3lXI7qyphGqdHKRGQO3Pb6fsh74i+TI6XQxnP5A2oYyXTFw9HNewEgH5CePjdv1xhwCMcSzL+J+DQk2/pnF3gLJW06Ohb6zVwpZu/bC4+ERka7SxADiL28TgmGMEW/QzBUjwhzJP5cpnXQSE90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=XkkRc2sN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XkkRc2sN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B3C4CEC8;
	Thu,  5 Sep 2024 03:13:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XkkRc2sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725505978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7QHNIyCnvMM7QKjw/oeD+gvYbfW6WRa706M5QtOWKQ8=;
	b=XkkRc2sN5huhNvAz7TUYVQAYx0L0hml+WNnzbbQXybhBETvg9XNBFDuDr31V4voFDe6wxL
	k4j1Pzy2ljuvqcSCbxiOilhFGmDCa4aVa1SOJpG3sWvkKmz7pOQbeO5hvuhJrZAWeL6QL8
	EuIYglJExd4R8QV2GRdZPR49vX1WCAg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e52504c4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 03:12:58 +0000 (UTC)
Date: Thu, 5 Sep 2024 05:12:55 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: maobibo <maobibo@loongson.cn>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	loongarch@lists.linux.dev, qemu-devel@nongnu.org,
	xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ZtkhtxcJUK-JediY@zx2c4.com>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>

On Tue, Oct 10, 2023 at 09:12:46AM +0800, maobibo wrote:
> Thomas,
> 
> Thanks for reporting this issue.
> 
> It is the problem of QEMU for LoongArch system, QEMU does not support 
> booting vmlinux with elf format without UEFI bios now. We will add 
> support to boot vmlinux directly on QEMU LoongArch side.

I ran into this same issue when trying to boot my test kernel for
Ruoyao's recent vDSO getrandom work. Is this something that was ever
addressed on the QEMU side?

Jason

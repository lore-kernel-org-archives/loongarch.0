Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A93210B
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="alZpDoQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1696882425; bh=ulLk2LfGe6WlK9vRunNHr+kO3Sko+WRiVOrmjUWzvkw=;
	h=Date:From:To:Subject:From;
	b=alZpDoQ+IeZO+8x6z3t9ZnnOTA8qk/DOJNII8Dy4vfGQS/U7V0Te6a2mpF83pvowa
	 fCUnz0iPJIczIY/n+S5C4xKUyb6aMOe4WWNKfTi7UP3afinL2AOMAYRmUEOHh9vNeK
	 Sy6HMnBPwsazwAAaOaLfYe4tERedWFBc2HizEr60=
Date: Mon, 9 Oct 2023 22:13:45 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: loongarch@lists.linux.dev
Subject: qemu direct kernel boot on LoongArch
Message-ID: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm trying to boot a LoongArch Linux via the direct kernel mode of qemu.
( qemu -kernel vmlinux -append "verbose" )
This doesn't work so well.

A few problems I encoutered:

* Linux reads the cmdline from $a1 during boot, but qemu doesn't place it there.
* Qemu puts a FDT at 1MiB but Linux doesn't use it.
* Qemu does not put the cmdline into the FDT.
* Linux panics in memory_present() because memblock_init() in
  arch/loongarch/kernel/mem.c did not set up any memblocks.
* Qemu has no support for initrds in direct kernel mode on LoongArch.

(All observations based on current git versions)

For the other architectures I'm using Linux/qemu with the direct kernel
mode works nicely including cmdline and initrds.

Are these restrictions by design/intentional or is it just for somebody
to do the necessary legwork?

The direct kernel mode is nice because it does not require the
installation of the additional EFI binary.


Thanks,
Thomas

Received: from rivendell.linuxfromscratch.org (rivendell.linuxfromscratch.org [208.118.68.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46017D26D
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.118.68.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266178; cv=none; b=LZ1MC9z5Hz6sbuqnNB5kL8osGC0g6r+HeswXvcdITxAtxDjxlj5cPIQs4Ucjt9BRgLgriRz78mgspF6BMohecyJ/eeM20bcN71tP/5MlosVVvMs3eyY1q6RfWdhq6JKli/j+g0K317H0eQ8Lgdgj1hI6R44rPHhyCvac3/0AS3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266178; c=relaxed/simple;
	bh=BuH3rOMwpipPFCIhibCVJzlZeTcZqwKaeG9RBlA6YrQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DYpDRTGA9P/jWlHHhnAyJTEle0tYfG9uyZCaUYwhMYRgFzG9wNwBnfb2JWOGMNxSeqAFL5cEQ6CComKy1OnaPTqu3Y1rfSeCzy6PV4b3b0fie8QFBQdvmtulQzhpJNi9bLs6kp+NPkKDmnkJw8Qa1YLQpoED/hN52MPdiAat0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfromscratch.org; spf=pass smtp.mailfrom=linuxfromscratch.org; dkim=pass (2048-bit key) header.d=linuxfromscratch.org header.i=@linuxfromscratch.org header.b=htTQt1cW; arc=none smtp.client-ip=208.118.68.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfromscratch.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfromscratch.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxfromscratch.org header.i=@linuxfromscratch.org header.b="htTQt1cW"
Received: from [127.0.0.1] (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 780141C013D;
	Thu,  6 Mar 2025 12:55:49 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.3.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1741265750;
	bh=BuH3rOMwpipPFCIhibCVJzlZeTcZqwKaeG9RBlA6YrQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=htTQt1cWWKmTQ9fLEa9tzSMk+UEP6VJrMcY3NE/PgPJ6sZvkITiWxC/Olq3p6zXYQ
	 HvwQQspogiSgva9gc1t3FOOHa1DkrfXfEwdaK9aDZp8s3lWY60gqRpDDXl57VaL6fR
	 gCND6xZfLArqiZCV1etdiFNXUhft19tTKLocLBWoAStQcwbuU/q2s3jf6SCGP0OYWj
	 L9Etoxy25MNBC6bIpdNgNQ+3mZkOV63HddcVQmsF+j2aaDGxbLiSeVKuNR9LcJco07
	 GNUjRIMkfv/agPjyseqAhdi5BhhcSy704pgfUA8zjPTwx/heZgPd7ktBavFytrYdsD
	 hFU7xzA84pCHg==
Message-ID: <1e6f33356ce63b19a730eda60719c3e5257e0dc0.camel@linuxfromscratch.org>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Vincent Li <vincent.mc.li@gmail.com>, loongarch@lists.linux.dev
Date: Thu, 06 Mar 2025 20:55:46 +0800
In-Reply-To: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
References: 
	<CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-03-05 at 16:53 -0800, Vincent Li wrote:
> Hi,
>=20
> I have an issue recorded here [0] with kernel call trace=C2=A0 when I sta=
rt
> loxilb, the loxilb tc BPF program seems to be loaded and attached to
> the network interface, but immediately it causes a loongarch kernel
> hard lockup, no keyboard response. Sometimes the panic call trace
> shows up in the monitor screen after I disabled kernel panic reboot
> (echo 0 > /proc/sys/kernel/panic) and started loxilb.

It's better to use a serial console to get the panic message.

Or if you can see the message on the screen just photo it and attach it.
If the message is incomplete or broken, enabling DRM panic and using a
DRM driver supporting it (for example just SimpleDRM driver running on
the EFI framebuffer, or AMDGPU with the latest 6.14 release candidate)
would likely help.

> Background: I ported open source IPFire [1] to Loongarch CPU
> architecture and enabled kernel BPF features, added loxilb as LFS
> (Linux from scratch) addon software

Please don't refer a system forked from Linux From Scratch many years
ago (even before multiple major refactors we've done for LFS) and for a
completely different objective as LFS.  Yes Linux From Scratch is not a
registered trademark so we cannot really stop you, but referring such a
thing as LFS will just puzzle people.


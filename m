Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D08139B
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737467189; cv=none; b=Fj8wI/n9pfn+1F+rRGdUXxxGnVrHliiiyMiUDszjKO2Lk90/wtSlR1ZdaQplOp6M25G5+uqAvbLFwXbLmJvGrmOSftoUrnCr23zqnSNNIYQHYXjbsk4tEAJ6cWIQ258ca7GGZKwqcM3aB6JqDUxXGxgmnMm+Hh2szzyJJma/Pak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737467189; c=relaxed/simple;
	bh=clgjWf6zNxo9jrujuOvySxyvFm8TZhPPlG3/S8Zb+d4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esbPekKQXXzOi15RhMBIlGb8/QLwCA/K3QY9tXo9cCTUex4IDXovaZ5wEwvRDUAMfV0TQxEdGGfJxB59XPsqP++YzrowkobPJMMUdUBfQv0spgZmgPjfjo+eL93QojjZ991VRbVrySj7Wd5tz38M+4gUhEtL/fi+gNKb3vmjlNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=FFHBxSC5; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="FFHBxSC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1737467181;
	bh=Ix0ZCBZRhbj9lA9iykLoCahGZpq5gBl6pPiqJVX/l6I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FFHBxSC5QvN1lfzvs+o8SMGpDOq87cqj7NGDF8yjm7OOgZ6xftbbtwNfoNvhZg/EY
	 rhg6D0yCTQet/L7s0naxI0Xy7xDWCmE7eB15EdzY7AteZe5cEpgbntzECtkwVGVPnz
	 1T56S59jNDxSy5HPOhMm7z8W6ptrh7+36ZTF4nN4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 616031A3F9D;
	Tue, 21 Jan 2025 08:46:19 -0500 (EST)
Message-ID: <42e64433f3255740292d428cf459959430fdc7e3.camel@xry111.site>
Subject: Re: [PATCH 2/2] LoongArch: Extend the maximum number of watchpoints
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 21 Jan 2025 21:46:17 +0800
In-Reply-To: <75b6fec7-f168-4bc3-9479-8a089bb4e033@xen0n.name>
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
	 <20250121070617.3214-3-yangtiezhu@loongson.cn>
	 <75b6fec7-f168-4bc3-9479-8a089bb4e033@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-01-21 at 21:35 +0800, WANG Xuerui wrote:
> one cannot account for older (in fact, *every existing*) clients=20
> expecting the old UAPI, hence providing a smaller buffer than struct=20
> user_watch_state_v2. In which case the kernel will happily write=20
> out-of-bounds if the client asks for the current watchpoint state. This=
=20
> is not acceptable I'm afraid.

Yes, many distros support running the latest kernel with an old
userspace for hardware compatibility reason and the change will blow up
gdb on all those distros.  We need to do something smarter to retain the
backward compatibility.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

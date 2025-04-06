Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56414375D
	for <loongarch@lists.linux.dev>; Sun,  6 Apr 2025 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743934700; cv=none; b=Q57mOwUFgw/JizU4dKCN/c1LL0o9Szh5znin0xAQLkA8MAAF+muD2VwSqoobRRTKuH1E+Dv4dXOxXyC+Mt0vAR8G3qfZfXo94RkCuyj3yJ+CThvY/BYyntwu49jvGrrMiKUzg3jsRl0ztGYS2x6cCI+HUyjucHy76hXKkHPxHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743934700; c=relaxed/simple;
	bh=I0l1AmLBc20P2Qs7xhg6QQCPseNDpCqJ8XhUkOVhZPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jI/z5mqv2jmufzej4klAp8zbYlA01dJS1oPaMdVO3QrbYSZjDRacgy+MDI5fRrOZcb7MpkeDu8aLsYOLvoMdW75hjzsPtRqd+ZTNdeOlJCQt31DSSV9dgbfiNMAZ79gtkVFHKwZ6I0wF9GvhN8IoqgFQYjwRUgL1hwLeY18qpUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JxtRS5C8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YX0OPukI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JxtRS5C8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YX0OPukI"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743934697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSOsfnzRMy9D9w4s2M+rmjytWyJ+cG8fZzYT24ApcBE=;
	b=JxtRS5C85HXMWumVICNO7yBH/gRNHQRbJgTCdUPtVteK3HkBvULi/zsI28lE94jbsmRmo+
	nwEwarRJfKeem++VAN8zcXhUDnOioTTgMfwga7k4Q98K3tpwzCIs3gywUdolFAPR1xlgg5
	V/p0Vq+Kgn5yLVZdiOSy0HwSUQd3XGN8T4NdgSVc/KXGiEP73kp4K7WNeGRQ5AojSohfmK
	Heve5T34UCuTrAQT0KYD8kTNC1pxtGEBUM49Jz6xaremwJD+64u2RcR5vOR4r62hUKlhVR
	RI9uIoAi2DWFHUpVvUUEmGTRNhmi7KWDeDUn55j1T7UKEUzAyuyz+UBTPGOlmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743934697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSOsfnzRMy9D9w4s2M+rmjytWyJ+cG8fZzYT24ApcBE=;
	b=YX0OPukIJZZjIzW75+eW5DK+hqZUsQPkGlRwG+LEuDPQ4LOFMRUJf6u7cpKuaEa6B3uqPi
	MJ9mAJBUNv92uoBw==
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, Yinbo Zhu
 <zhuyinbo@loongson.cn>
Subject: Re: [PATCH] irqchip/loongson-liointc: Support to set
 IRQ_TYPE_EDGE_BOTH
In-Reply-To: <CAAhV-H5sO0x1EkWks5QZ8ah-stB7JbDk6eFFeeonXD6JT9fHAw@mail.gmail.com>
References: <20250402092500.514305-1-chenhuacai@loongson.cn>
 <87jz81uty3.ffs@tglx>
 <CAAhV-H5sO0x1EkWks5QZ8ah-stB7JbDk6eFFeeonXD6JT9fHAw@mail.gmail.com>
Date: Sun, 06 Apr 2025 12:18:16 +0200
Message-ID: <87bjt9wq3b.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 06 2025 at 17:46, Huacai Chen wrote:
> On Thu, Apr 3, 2025 at 11:48=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>> But it won't trigger on both. So no, you cannot claim that this fixes
>> anything.
> Yes, it won't trigger on both (not perfect), but it allows drivers
> that request "both" work (better than fail to request), and there are

By some definition of 'work'. There is probably a good technical reason
why those drivers expect EDGE_BOTH to work correctly and otherwise fail
to load.

You completely fail to explain, why this hack actually 'works' and what
the implications are for such drivers.

> other irqchip drivers that do similar things.

Justifying bogosity with already existing bogosity is not a technical
argument.

Thanks,

        tglx

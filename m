Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3FE1372
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725513919; cv=none; b=fsReiaLiXlrOlQCj2amOWXFTmByHC8m8XRUFrFXFy9FIIIyCaidjhPkSxC6L0V4ILh1EFZ2ymhwHzzbSYKpRHuciJz4axbG9OjELZZ4CJxeM+qkk8DnbUkOZ8sFobgF8e6HOjQ66JJqgLWlPnrODa20gPzN71R4j0dTgleCk3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725513919; c=relaxed/simple;
	bh=zD5piTKugfY0CtGPWOJ5+IZRcl98xObmF8Eih1TMT4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7mLXkr3sGWmLqWqXK/WwlutD/v4L7bXHZTDZhb1GEANm5NEoZN64EVSqsFI5CdL4VuttfrvMuwueIwP9UiDxM2jnbmaBq+SqJu9LhM/Sr9+OJXzGwudOZOiCWvtAGX+UAuDVNS1xBXDXU0zanMHSkO0z9EVCBb/xPMze8HErhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=ATnshvs1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="ATnshvs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1725513906; bh=zD5piTKugfY0CtGPWOJ5+IZRcl98xObmF8Eih1TMT4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATnshvs1dMCTBEoJaqmwlfQm9EpaHnzgABz1SdUCjlKbQAIdMWlrDZTRdfjIYowqm
	 3KAJZMvJzaloXoxNhzhvl26Sbqq9SJv8InoQwE0DHcKh9JpZNtmk1YCpa8JYmdAg5+
	 zzR+AS/Jz2amZyankixw5NmQeX8mA5+pcmR1GpH4=
Date: Thu, 5 Sep 2024 07:25:05 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: maobibo <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	qemu-devel@nongnu.org, xry111@xry111.site
Subject: Re: qemu direct kernel boot on LoongArch
Message-ID: <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>

On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
> >
> > Jason,
> >
> > With the latest qemu 9.1 version, elf format booting is supported.
> 
> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
> And the 1G minimum ram limit is gone too.
> 
> Now working on how to trigger resets.

With "reset" do you mean normal (non-panic) system shutdown/poweroff?
Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
that in a cross-architecture way.


Thomas

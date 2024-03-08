Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05965FB8B
	for <loongarch@lists.linux.dev>; Fri,  8 Mar 2024 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709936414; cv=none; b=fYB59zK6RTInSO/Wcpt0xZhvWofTXjiyGbxVwUez0FvBBRYKd50mjsn/7PeD+BqbOUj+I+jxSTt9wxvw55Gho9TeSuvYChvDrdn1z1nkQGjZ1EtPHpuyEJBC7oMlLWSXkuEOPvBCdRS4xwR4CBH8wyc3HR9kH+8KHzQWaXI5x9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709936414; c=relaxed/simple;
	bh=UvaPv/XPHrH2WNEAzYheoSrYhZzFwh6ItrrN3RRyQiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/cyq5tFvl1P7/lCBjphgBsnVrgz6AtdmQ5/L4K/mG2P044EYXHx5gIW9Te5kQJ8W59zGnQSYunPM5B62P8bEKXcB+eMOYOdW8ZGbIlPoZRYLj0s351UV6ekuZPW9zufj2sy1OkL+fqziitt2FxoLAbovt8SkJp0KS27lwFR+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QworHRiF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QworHRiF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4131f5f7d47so560785e9.1
        for <loongarch@lists.linux.dev>; Fri, 08 Mar 2024 14:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709936411; x=1710541211; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j62oPnIVjNXEkLwc6x1vxDDwPNWZwfNz/IeZcBMO0U4=;
        b=QworHRiFb2IsOyspBqQnrlfSDQ49EfQnGz26Lh5QndZhqJ4rJDb/AcFgB5ettrPb8g
         LGLCPaKo8+6K5jQ4aGqI3dqtwiHR+5XWSL8omL726maqoCrnIcJgNJxbQGFRcu799kZ4
         O1FhUvmjxWZGr3tRQQDu8Qo35FcDDAZKSsnQjF0FqJqeyLzMeO10DxMDZutThG6MbqGn
         z+e9O7FoJTlrCmogmUx5/wNo3nuy2BuKr/gtWgLTPeqMIJR7Uzx13zkqCRMRbeJCHGTw
         iuIxgU4RSO4HZJE7VlgsUGHTNlW/YJEDu1g+r6y5P++phXKxBDnBcx7gcB8H4oD2jB61
         OiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709936411; x=1710541211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j62oPnIVjNXEkLwc6x1vxDDwPNWZwfNz/IeZcBMO0U4=;
        b=G1b5e69Np2+bz8Tp+CW6ZDbOKAKtuMctjV91CQbjztTPEZGchDrIF59hR69fCMDMDH
         0sLczMAp37LUvX9r0ABlS09n1Ai6G2QG7BVYeCUmmdaJ0vVt9PC/L+ekP4uhUWReEjtF
         Hkwd2flNJFMkWfBhaRHu7wVok8oSs+k6fuVjGhm/RyCsM8meY+fj8mxEMyF91J+oUZ9c
         pnJNPRKLxqrEK/7+fgK9vR6mE4D2CiYbVz8VG40GekaapPNn2FVbzwMkEvCCSJF9jZ4g
         hgk06k+C3T8DVx1FS0HdxFbmwL3X9d9xHy8Pkv7RFs8n8AF0mq+X2SOPCRkviyDECJVz
         k87Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaS8PCIZ7YBL9yBo9VgbEDc6jDz5Q5zEPZpLSsJoLnewfJMw7lZUtKXX3f+xXXEgYGhBDtkc7WbvYzHRUCgIDUBA56nJlYvKd2
X-Gm-Message-State: AOJu0YxJaAaj10Kwtcz+rs91mZrRdTclSP3Mxe5z1BLv/GAoeQna2rwc
	d+5FANe6o9G9sCmjlNKot+rjSdFo7NYGCBEYctP0y7B9kHsdM8/C
X-Google-Smtp-Source: AGHT+IE5arD0uaO0cShKSZUbPrmiaI8REwNOOjBGWARkTT+WqsPSIbayV70MjZcasIR3uWjdwQ0JcQ==
X-Received: by 2002:a05:600c:ccb:b0:413:1438:cbd4 with SMTP id fk11-20020a05600c0ccb00b004131438cbd4mr359744wmb.17.1709936410844;
        Fri, 08 Mar 2024 14:20:10 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b00412c8117a34sm608258wmb.47.2024.03.08.14.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 14:20:09 -0800 (PST)
Date: Fri, 8 Mar 2024 22:20:08 +0000
From: Stafford Horne <shorne@gmail.com>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: chenhuacai@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, ysato@users.sourceforge.jp,
	dalias@libc.org, glaubitz@physik.fu-berlin.de, robh+dt@kernel.org,
	frowand.list@gmail.com, linux-openrisc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH 0/3] Restructure init sequence to set aside reserved
 memory earlier
Message-ID: <ZeuPGOzPpOuUFTwF@antec>
References: <1707524971-146908-1-git-send-email-quic_obabatun@quicinc.com>
 <467b8479-dfd8-43a4-92eb-d19dc65989cd@quicinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <467b8479-dfd8-43a4-92eb-d19dc65989cd@quicinc.com>

On Tue, Mar 05, 2024 at 10:59:20AM -0800, Oreoluwa Babatunde wrote:
> 
> On 2/9/2024 4:29 PM, Oreoluwa Babatunde wrote:
> > The loongarch, openric, and sh architectures allocate memory from
> > memblock before it gets the chance to set aside reserved memory regions.
> > This means that there is a possibility for memblock to allocate from
> > memory regions that are supposed to be reserved.
> >
> > This series makes changes to the arch specific setup code to call the
> > functions responsible for setting aside the reserved memory regions earlier
> > in the init sequence.
> > Hence, by the time memblock starts being used to allocate memory, the
> > reserved memory regions should already be set aside, and it will no
> > longer be possible for allocations to come from them.
> >
> > I am currnetly using an arm64 device, and so I will need assistance from
> > the relevant arch maintainers to help check if this breaks anything from
> > compilation to device bootup.
> >
> > Oreoluwa Babatunde (3):
> >   loongarch: Call arch_mem_init() before platform_init() in the init
> >     sequence
> >   openrisc: Call setup_memory() earlier in the init sequence
> >   sh: Call paging_init() earlier in the init sequence
> >
> >  arch/loongarch/kernel/setup.c | 2 +-
> >  arch/openrisc/kernel/setup.c  | 6 +++---
> >  arch/sh/kernel/setup.c        | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> Hello,
> 
> Loongarch patch has already merged for this, but review is still pending
> from openrisc and sh architectures.
> Could someone please comment on these?

Hello,

The OpenRISC patch looks fine to me.  I will test it out.  Sorry, I thought you
were getting this merged via other means.

-Stafford

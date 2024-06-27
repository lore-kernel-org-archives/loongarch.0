Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6D198A34
	for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502260; cv=none; b=Jv1KXCXyTVPbRAPzoHFuayy+7HirFkxeUHqrLtYPMlXHPm9JLz5TH5bNqusseh7FhokLDnNf3MnUVzO6dTXrpdApK82FxbtDfs3AP5ZavBgLaDG5rJzfl/5kaRPTC5Wx6lid8lNK7tzogXA+HpVmE+6QL7pp4FtKCOvsZdzRcNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502260; c=relaxed/simple;
	bh=ST574pguHikK10RThvE3ToWvprmcnKje0BV9CfOw4cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUEoZlPvPfO+SeMB320vafGVV8pEcKDxamqpiwM5QAaMkERrJLBf91muIoOyDkDUpQ9AmZiMeIm9dtUjHXQgMiFPKZbmk5fFQhMPlKi7et5xsENOhylHch+PVO/Aze6GxIWS334HgZzoU0wgc1NLJtjNLRfyr/08PVj/pF2fkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMGDAZ2x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMGDAZ2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719502258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ST574pguHikK10RThvE3ToWvprmcnKje0BV9CfOw4cw=;
	b=QMGDAZ2xakv+In9mMl5dNdKA4Ef31kkRvsv+2znJtDNTPO6qMpmX8rGgaC3zS1oqKiyjmK
	t4fXIsdYcVPZ2NTYqQllvZfG2zV3M39roIO3MHo21SGllBV3f5Q98k4jML+d3yTTZp05UL
	AfiPbPW/kQyQQ/W9sorsOfy/vFvi+90=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-uEjw7J6ZMOCFvC6FClU9cg-1; Thu,
 27 Jun 2024 11:30:53 -0400
X-MC-Unique: uEjw7J6ZMOCFvC6FClU9cg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C014D195609E;
	Thu, 27 Jun 2024 15:30:50 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.18])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4FFBB19560A3;
	Thu, 27 Jun 2024 15:30:46 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 27 Jun 2024 17:29:17 +0200 (CEST)
Date: Thu, 27 Jun 2024 17:29:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH] uprobe: Do not use UPROBE_SWBP_INSN as static initializer
Message-ID: <20240627152910.GB21813@redhat.com>
References: <20240618194306.1577022-1-jolsa@kernel.org>
 <CAEf4BzbN4Li2iesQm28ZYEV2nXsLre8_qknmvkSy510EV7h=SA@mail.gmail.com>
 <20240620193846.GA7165@redhat.com>
 <CAEf4BzaqgbjPfxKmzF-M7nzGroOwKikA0BM7Tnw7dKzKS+x9ZQ@mail.gmail.com>
 <20240621120149.GB12521@redhat.com>
 <ZnV9hvOP5388YJtw@krava>
 <Zn1ssLPeMj-On_uT@krava>
 <20240627232032.a202e546f59a0290c615510f@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627232032.a202e546f59a0290c615510f@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 06/27, Masami Hiramatsu wrote:
>
> On Thu, 27 Jun 2024 15:44:16 +0200
> Jiri Olsa <olsajiri@gmail.com> wrote:
>
> > Oleg, do you want to send formal patch?
> >
> > thanks,
> > jirka
>
> Yes, can you send v2 patch?

I was waiting for the comments from loongarch maintainers...

OK, will do today, but the patch won't be even compile tested.

Oleg.


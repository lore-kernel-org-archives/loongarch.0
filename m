Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA141A4E0;
	Fri, 21 Aug 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299716; cv=none; b=f7idPLz/nCWKLko1SlK3vu67nrtgmmSDLl5ET/Ql5z7ccix8vC43EVtnA3impdBIqPc/vHsX1NTJnvUAv1dWgVKm/Ew2V/OTTVJL9Cm5oGja6AfkOSaprnndnKPvObgFGYTehPD8LcXKJmo3g/2BJfSH2YIFIUX2zn8SJgin7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299716; c=relaxed/simple;
	bh=YvIqsKW9CoFQNqJFEZo1AtqdqXEWKuh0LHcDfNhDyB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaWPQyTrFAFFFPZ/ucSdqiuIoiSnwhRIUGTMnU/2ny3XbRT22GWMa5d2kxMLdVRAOpm9KaLRDhphZR+AyRTQPpi/G8suq30tvRXhgc9SnoTiQ5odHz1IWxLgtS6DnN0aQerOBohdYmcsHlX0lfZAh67VmRYLxxjsA0ZNww7aDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+gRjS8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+gRjS8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35361F000E9;
	Fri, 21 Aug 2026 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299715;
	bh=log9Y1/FtX7D4hpSxqOjc6RYDMSqMNLwZMRoYqyuEwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a+gRjS8ypMPY4upPxQqn7EhNHpp/wLA9eFbeqPkRIFc4PcWLkxdTApSE9rNoRh1VN
	 ckqOFqmlIuGgzk805hQVKJkEni3qBXfkPEWpFZ4+vPb8opDeut3L9gkOU4q8vuPgX9
	 TZ9qhSgPJpT+M4Dk1C1MoKrA2W7hu9G9lqmc5AtrQkRBv/tMfHVYKR0NOgjFEJMwmB
	 S/eHEnKAXmXjmVz6rlGoOxIOm4lA3KMBwVYxAEF7X7nrEaar0OUfWVydllmT6OPFTK
	 sEN4uXUNQneR8CH056dQbqXL7xbvJD04vs1NEoKWHzKWJz+nh9v7aLW4kQQ1a4VEIA
	 pbgq8bjA0UF+A==
Date: Fri, 21 Aug 2026 11:08:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Tao Liu <ltao@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Message-ID: <aogHeKQ8UnudNAMu@kernel.org>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen>
 <2vxzik54zmpp.fsf@kernel.org>
 <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>

On Fri, Aug 21, 2026 at 12:48:15PM +0530, Mukesh Pilaniya wrote:
> Hi Philipp,
> 
> On 20/08/26 11:41 pm, Pratyush Yadav wrote:
> > On Thu, Aug 20 2026, Philipp Rudo wrote:
> > 
> >> Hi Mukesh,
> >> Hi Pratyush,
> >>
> >> having this patch makes sense. Personally I'd go with having a
> >> switch-case rather than individual if-blocks. E.g.
> >>
> >> 	switch (ret) {
> >> 		case 0:
> >> 			image->fops = *fops;
> >> 			return 0;
> >> 		case -ENOEXEC:
> >> 			continue;
> >> 		default:
> >> 			return ret;
> >> 	}
> >>
> >> IMHO that is better readable and easier to extend in case other error
> >> codes need special handling as well. But that is only my personal
> >> opinion.
> > 
> > Well, IMO both look roughly the same so I unless Mukesh prefers your
> > version more, we can keep it as-is.
> > 
> Thanks for the review. I agree the switch-case reads nicely, but since
> the current version is functionally equivalent and already
> reviewed, I'll keep it as-is to avoid re-spinning for a style change.
> Happy to switch if you or Pratyush feel strongly about it.

I'd like to request another style change :)

In newer code we often use 'err' rather than 'ret', so it's more obvious
what this variable about.

I don't feel strong about if or switch, but if you go with if, please don't
compare to 0, use !err.

-- 
Sincerely yours,
Mike.
